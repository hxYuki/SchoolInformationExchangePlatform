<template>
  <div id="bg">
    <el-row>
      <el-col :span="4" :offset="2">
        <logo></logo>
      </el-col>
      <el-col :span="4" :offset="12">
        <!-- <action></action> -->
        <!-- <span :hidden="true">{{asd}}</span> -->
      </el-col>
    </el-row>
    <div class="item-form">
      <el-form :model="itemForm" ref="itemForm" :rules="rules">
        <div class="flex-content">
          <el-form-item prop="pictures">
            <el-upload
              v-model="itemForm.pictures"
              name="itemPic"
              ref="itempic"
              class="upload"
              drag
              multiple
              :auto-upload="true"
              :limit="5"
              list-type="picture"
              :on-success="imageUploaded"
              :on-remove='rmImg'
              action="http://localhost/schoolpublish/php/public/index.php/imageCollect">
              <i class="el-icon-plus avatar-uploader-icon"></i>
              <div style="line-height:0" class="el-upload__tip" slot="tip">添加物品图片</div>
            </el-upload>
          </el-form-item>
          
          <div class="oth-info">
            <el-form-item label="发布类型" prop="type">
              <el-switch v-model="itemForm.type" active-text="公告" inactive-text="物品" active-value="message" inactive-value="sale"></el-switch>
            </el-form-item>
            <el-form-item :label="titleLabel" prop="itemName">
              <el-input v-model="itemForm.itemName"></el-input>
            </el-form-item>
            <el-form-item label="标签" prop="tags">
              <div style="display:inline-block;width:100%;text-align:left">
                <el-upload hidden v-model="itemForm.tags" action=""></el-upload>
                <el-tag
                  :key="tag"
                  v-for="tag in itemForm.tags"
                  closable
                  :disable-transitions="false"
                  @close="handleClose(tag)">
                  {{tag}}
                </el-tag>
                <el-autocomplete
                  class="input-new-tag"
                  :style="{'width':150+'px'}"
                  v-if="inputVisible"
                  v-model="tagInputValue"
                  ref="saveTagInput"
                  size="small"
                  :fetch-suggestions="getSuggestions"
                  :select-when-unmatched="true"
                  @select="selectTag"
                  @keyup.enter.native="handleInputConfirm"
                  @blur="handleInputConfirm"
                >
                </el-autocomplete>
                <el-button v-else class="button-new-tag" size="small" @click="showInput">+ 添加标签</el-button>
              </div>
            </el-form-item>
            <el-form-item label="期望价格" prop="price" v-if="isSale">
              <el-input v-model="itemForm.price"></el-input>
            </el-form-item>
            <el-form-item :label="descriptionLabel" prop="description">
              <el-input type=textarea autosize v-model="itemForm.description"></el-input>
            </el-form-item>
            
          </div>
        </div>
        <el-form-item>
          <el-button @click="cancel()">取消</el-button>
          <el-button type="primary" @click="Submit()">发布</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>
<script>
import logo from './c/logo';
import Axios from 'axios';
// import {debounce} from '../../tools/debounce'

export default{
  components:{
    logo:logo,
  },
  data() {
    var itemNameValidator=(rule,value,callback)=>{
      let nameReg=/^[a-zA-Z0-9 ()（）%~·‘’“”''"".<>《》、：:【】—\-_\u4e00-\u9fa5]*$/
      let nameReg2=/^[0-9 _]*$/
      if(!value) callback(new Error(this.titleLabel+'不能为空'))
      else if(!nameReg.test(value)) callback(new Error(this.titleLabel+'不可以包含连接符 下划线 空格 括号 百分号以外的特殊字符'))
      else if(nameReg2.test(value)) callback(new Error(this.titleLabel+'不能全为数字'))
      else if(value.length>80||value.length<4) callback(new Error(this.titleLabel+'长度应在4~80个字符之间'))
      else callback()
    }

    var tagsValidator=(rule,value,callback)=>{
      if(value.length<3) callback(new Error('请至少选择三个标签'))
      else {
        this.updateTags()
        callback()
      }
    }

    var priceValidator=(rule,value,callback)=>{
      if(this.isSale&&!value) callback(new Error('价格不能为空'))
      else callback()
    }
    return {
      itemForm:{
        sellerId:'',
        type:'sale',
        pictures:[],
        itemName:'',
        tags:[],
        price:'',
        description:''
      },
      rules:{
        itemName:[
          {validator:itemNameValidator,trigger:'blur'}
        ],
        tags:[
          {validator:tagsValidator,trigger:'blur'}
        ],
        price:[
          {validator:priceValidator,trigger:'blur'}
        ],
      },
      pic:{},
      receiveTags:[],
      mostUseTags:[],
      inputVisible: false,
      tagInputValue: '',

      flag:'',
    };
  },
  methods: {
    checkLogin(){
      if(this.usTok==='')
        this.$router.go(-1)
    },
    imageUploaded(res,file){
      this.pic[file.name]=res
      this.itemForm.pictures.push(res)
    },
    rmImg(file,filelist){
      let imgId=this.pic[file.name]
      let index=this.itemForm.pictures.indexOf(imgId)
      
      this.itemForm.pictures.splice(index,1)
      delete this.pic[file.name]

      return Axios.post('imageRemove',{'imgId':imgId}).then(res=>{

      })
    },
    updateTags(){
      return Axios.post('updateTagUse',{'tags':JSON.stringify(this.itemForm.tags)})
    },
    getTags(query=""){
      return Axios.post('getTagSuggestion',{'query':query}).then((res)=>{
        let tagArray=[]
        let strA=res.data.split(',')
        let t={}
        strA.forEach(el => {
          t.value=el
          tagArray.push(t)
          t={}
        });
        return tagArray
      })
    },

    getSuggestions(input,callback){
      let result=[]
      if(input){
        this.getTags(input).then((rec)=>{
          result=rec
          callback(result)
        })
      }else{
        result=this.mostUseTags
        callback(result)
      }

      
    },
    selectTag(tag){
      let tagInputValue = this.tagInputValue;
      if (tagInputValue) {
        this.itemForm.tags.push(tagInputValue);
      }
      this.inputVisible = false;
      this.tagInputValue = '';
    },

    handleClose(tag) {
      this.itemForm.tags.splice(this.itemForm.tags.indexOf(tag), 1);
    },
    showInput() {
      this.inputVisible = true;
      this.$nextTick(_ => {
        this.$refs.saveTagInput.$refs.input.focus();
      });
    },
    handleInputConfirm() {
      
    },
    cancel(){

    },
    Submit(){
      // this.$refs.itempic.submit()
      let d=''
// this.$router.push('/')
      
      this.$refs.itemForm.validate((valid) => {
        if (valid) {
          this.postData().then(res=>{
            if(res.status!==200){
              this.$message.error('网络错误')
              return false
            }else{
              d=res.data
              if(d==='ERR'){
                this.$message.error('发布错误')
                return false
              }else{
                this.$message.success('发布成功')
                window.location.hash="#/item?id="+d
              }
            }
            // return true
          })
        } else {
          this.$message.error('表单填写有误')
          return false
        }
      })
        
    },
    postData(){
      let data=JSON.stringify(this.itemForm)
      return Axios.post('putItem',{'item':data})
    }
  },
  created() {
    this.checkLogin()
    this.itemForm.sellerId=this.usTok.split(';')[0]
    this.getTags().then((rec)=>{
      this.mostUseTags=rec
    })
  },
  computed: {
    isSale:function(){
      return this.itemForm.type==='sale'
    },
    titleLabel:function(){
      return this.isSale?'名称':'标题'
    },
    descriptionLabel:function(){
      return this.isSale?'描述':'内容'
    },
    usTok:function(){return this.$store.state.userToken},

    // asd:function(){
    //   if(this.flag!=='')
    //     this.$router.push({path:'/item'})
    //   return this.flag
    // }
  },
  watch: {
    
    
  },
}
</script>
<style>
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}
.el-tag + .el-tag {
  margin-left: 10px;
}
.button-new-tag {
  margin-left: 10px;
  height: 32px;
  line-height: 30px;
  padding-top: 0;
  padding-bottom: 0;
}
.input-new-tag {
  width: 90px;
  margin-left: 10px;
  vertical-align: bottom;
}
.item-form{
  width: 80%;
  margin: 0 auto;
}
.el-upload-dragger{
  width: unset;
  height: unset;
}
.flex-content{
  display: flex;
  justify-content: space-around;
}
.oth-info{
  width: 55%;
}
</style>
