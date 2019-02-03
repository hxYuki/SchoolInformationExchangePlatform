<template>
  <div id="bg">
    <el-row>
      <el-col :span="4" :offset="2">
        <logo></logo>
      </el-col>
      <el-col :span="4" :offset="12">
        <!-- <action></action> -->
      </el-col>
    </el-row>
    <div class="item-form">
      <el-form v-model="itemForm" ref="itemForm" :rules="rules">
        
        <div class="flex-content">
          <el-form-item prop="pictures">
            <el-upload
              v-model="itemForm.pictures"

              class="upload"
              drag
              multiple
              :auto-upload="false"
              :limit="5"
              action="">
              <i class="el-icon-plus avatar-uploader-icon"></i>
              <div style="line-height:0" class="el-upload__tip" slot="tip">添加物品图片</div>
            </el-upload>
          </el-form-item>
          
          <div class="oth-info">
            <el-form-item label="名称" prop="itemName">
              <el-input v-model="itemForm.itemName"></el-input>
            </el-form-item>
            <el-form-item label="标签" prop="tags">
              <div style="display:inline-block;width:100%;text-align:left">
                <el-upload hidden v-model="itemForm.tags" action=""></el-upload>
                <el-tag
                  :key="tag"
                  v-for="tag in dynamicTags"
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
            <el-form-item label="期望价格" prop="price">
              <el-input v-model="itemForm.price"></el-input>
            </el-form-item>
            <el-form-item label="描述" prop="description">
              <el-input type=textarea autosize v-model="itemForm.description"></el-input>
            </el-form-item>
            
          </div>
        </div>
        <el-form-item>
          <el-button>取消</el-button>
          <el-button type="primary" @click="Submit">发布</el-button>
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
    return {
      itemForm:{
        pictures:[],
        itemName:'',
        tags:[],
        price:'',
        description:''
      },
      rules:{
        pictures:[],
        itemName:[],
        tags:[],
        price:[],
        description:[]
      },

      receiveTags:[],
      mostUseTags:[],
      dynamicTags: [],
      inputVisible: false,
      tagInputValue: ''
    };
  },
  methods: {
    checkLogin(){
      if(typeof this.$store.userToken==='undefined'||this.$store.userToken==='')
        this.$router.go(-1)
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
      this.getTags(input).then((rec)=>{
        result=input?rec:this.mostUseTags
        callback(result)
      })
    },
    selectTag(tag){
      let tagInputValue = this.tagInputValue;
      if (tagInputValue) {
        this.dynamicTags.push(tagInputValue);
      }
      this.inputVisible = false;
      this.tagInputValue = '';
    },

    handleClose(tag) {
      this.dynamicTags.splice(this.dynamicTags.indexOf(tag), 1);
    },
    showInput() {
      this.inputVisible = true;
      this.$nextTick(_ => {
        this.$refs.saveTagInput.$refs.input.focus();
      });
    },
    handleInputConfirm() {
      
    },

    Submit(){

    }
  },
  created() {
    // this.checkLogin()
    this.getTags().then((rec)=>{
      this.mostUseTags=rec
    })
    
      

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
.upload{
  /* width: 35%; */
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
