<template>
  <div id="bg" class="half">
    <el-row>
      <el-col :span="6">
        
      </el-col>
    </el-row>
    <el-row>
      <el-col :span="20" :offset="2">
        <el-card class="form-container">
          <el-form :model="userForm" :rules="rules" ref="userForm" label-width="100px" class="demo-ruleForm">
            <el-form-item label="用户名" prop="nickname">
              <el-input v-model="userForm.nickname" clearable></el-input>
            </el-form-item>
            <el-form-item label="密码" prop="password">
              <el-input v-model="userForm.password" clearable></el-input>
            </el-form-item>
            <el-form-item label="确认密码" prop="confiPassword">
              <el-input v-model="userForm.confiPassword" clearable></el-input>
            </el-form-item>
            <el-form-item label="所在校区" prop="location">
              <el-radio-group v-model="userForm.location">
                <el-radio :label="loca" v-for="(loca,index) in locations" :key="index">{{loca}}</el-radio>
              </el-radio-group>
            </el-form-item>
            <el-form-item label="真实姓名" prop="realname">
              <el-input v-model="userForm.realname" clearable></el-input>
            </el-form-item>
            <el-form-item label="学号" prop="stuId">
              <el-input v-model="userForm.stuId" clearable></el-input>
            </el-form-item>
            <el-form-item label="校园卡正面" prop="pic" style="height:200px;">
              <el-upload
                v-model="userForm.pic"
                name="stuCard"
                class="avatar-uploader"
                action="http://localhost/schoolpublish/php/public/index.php/imageCollect"
                :show-file-list="false"
                :on-success="uploadSuccess"
                :before-upload="beforeUpload">
                <img v-if="imageUrl" :src="imageUrl" class="avatar" style="height:200px">
                <i v-else class="el-icon-plus avatar-uploader-icon"></i>
              </el-upload>

            </el-form-item>
            <el-form-item>
              <el-button @click="submitForm()" type="primary" class="sbmt-btn">注册</el-button>
              <el-button @click="resetForm()">重置</el-button>
            </el-form-item>
          </el-form>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>
<script>
import logo from './c/logo'
import bg from '../../assets/images/login_bg.jpg'
import Axios from 'axios'
import crypto from 'js-sha256'

export default{
  components:{
    logo:logo,
  },
  data(){
    var checkName=(rule,value,callback)=>{
      let nameReg=/^[a-zA-Z0-9_\u4e00-\u9fa5]*$/
      if(!nameReg.test(value))
        callback(new Error('用户名中不可以包含下划线以外的特殊字符'))
      else callback()
    }
    var checkRepeatNickname=(rule,value,callback)=>{
      let c=''
      let data={}
      data.checkField='nickname'
      data.checkValue=value
      Axios.post('checkRepetation',data).then((res)=>{
        c=res.data
        if(c!=='')
          callback(new Error('用户名重复'))  //repeated
        else callback()
      })
    }
    var checkPwdStrength=(rule,value,callback)=>{
      let allNumber=/^[0-9]*$/
      if(allNumber.test(value))
        callback(new Error('密码不能全为数字'))
      else callback()
    }
    var checkRepeatPwd=(rule,value,callback)=>{
      if(value!==this.userForm.password)
        callback(new Error('两次输入密码不一致'))
      else callback()
    }
    var checkId=(rule,value,callback)=>{
      let n=/\d{10}/
      if(!n.test(value)) callback(new Error('学号为10个数字'))
      else callback()
    }
    var checkRepeatId=(rule,value,callback)=>{
      let c=''
      let data={}
      data.checkField='id'
      data.checkValue=value
      Axios.post('checkRepetation',data).then((res)=>{
        c=res.data
        if(c!=='')
          callback(new Error('用户名重复'))  //repeated
        else callback()
      })
    }

    return{
      userForm:{
        nickname:'',
        password:'',
        confiPassword:'',
        location:'',
        realname:'',
        stuId:'',
        pic:'',
      },
      rules:{
        nickname:[
          {required:true,message:"用户名不能为空",trigger:'blur'},
          {min:3,max:16,message:"用户名必须在3~16个字符之间",trigger:'blur'},
          {validator:checkName,trigger:'blur'},
          {validator:checkRepeatNickname,trigger:'blur'}
        ],
        password:[
          {required:true,message:"密码不能为空",trigger:'blur'},
          {min:8,max:20,message:"密码必须在8~20个字符之间",trigger:'blur'},
          {validator:checkPwdStrength,trigger:'blur'}
        ],
        confiPassword:[
          {required:true,message:"请确认密码",trigger:'blur'},
          {validator:checkRepeatPwd,trigger:'blur'}
        ],
        location:[
          {required:true,message:"请选择校区",trigger:'blur'}
        ],
        realname:[
          {required:true,message:"请输入你的名字",trigger:'blur'}
        ],
        stuId:[
          {required:true,message:"请输入你的学号",trigger:'blur'},
          {validator:checkId,trigger:'blur'},
          {validator:checkRepeatId,trigger:'blur'}
        ],
        pic:[
          // {required:true,message:"请上传图片"}
        ]
      },

      locations:[],
      imageUrl: '',
      imagePosted:false,
      processed:false
    }
  },
  methods:{
    getBaseData(){
      Axios.post('fetchLocation').then((res)=>{
        this.locations=res.data
      })
    },
    postData(){
      console.log(1);
      let data=JSON.parse(JSON.stringify(this.userForm))
      
      data.password=crypto.sha256(data.password)
      data.confiPassword=""
      Axios.post('userRegister',{'regdata':JSON.stringify(data)}).then((res)=>{
        //TODO: add process after register

        if(res.statusText==='OK')
          this.$message.success('提交成功！')
        else
          this.$message.error('提交失败')
      })
    },
    submitForm() {
      this.$refs['userForm'].validate((valid) => {
        if (valid||this.imagePosted) {
            this.postData()
        } else {
          this.$message.error('表单填写有误')
          return false
        }
      })
    },
    resetForm() {
      this.$refs['userForm'].resetFields()
      this.$message.info('已重置')
    },
    uploadSuccess(res, file) {
      if(typeof res==='string')
      {
        this.$message.error(res)
        this.imagePosted=false
        return false
      }
      this.userForm.pic=res
      this.$refs['userForm'].validateField(['pic'])
      this.imagePosted=true
      this.imageUrl = URL.createObjectURL(file.raw);
    },
    beforeUpload(file) {
      
      const isJPG = file.type === 'image/jpeg' || file.type ==='image/png' || file.type ==='image/gif'
      const isLt2M = file.size / 1024 / 1024 < 2

      if (!isJPG) {
        this.$message.error('上传头像图片只能是 jpg/gif/png 格式!');
      }
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 2MB!');
      }
      return isJPG && isLt2M;
    },

  },
  created() {
    this.getBaseData()
  },
}
</script>
<style>
#bg.half{
  width: 50%;
  margin: 0 auto
}
.avatar-uploader>div{
  width: 70%;
  height: 200px;
  margin-left: 15%;
  margin-right: 15%;
  border: 3px #409EFF;
  border-style: dashed;
  border-radius: 5px;
}
.avatar-uploader>div>i{
  width: 200px;
  height: 200px;
  line-height: 200px;
  font-size: 40px;
  font-weight: 1000;
  color: rgb(121, 121, 121)
}
</style>
