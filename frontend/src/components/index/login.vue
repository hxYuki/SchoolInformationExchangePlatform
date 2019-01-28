<template>
  <div id="bg" :style="{'height':windowHeight+'px','padding':'0 40px'}">
    <el-row>
      <el-col :span="6">
        <logo></logo>
        <action :hidden='true'></action>
      </el-col>
    </el-row>
    <el-row>
      <el-col :span="6" :offset="18" style="position:relative;">
        <el-card class="form-container">
          <el-form :model="loginForm" :rules="rules" ref="loginForm" label-width="0">
            <el-form-item prop="account">
              <el-input v-model="loginForm.account" placeholder="用户名/学号" clearable></el-input>
            </el-form-item>
            <el-form-item prop="password">
              <el-input type="password" v-model="loginForm.password" placeholder="密码" clearable></el-input>
            </el-form-item>
            <el-form-item>
              <div class="btn-container">
                <a href="/#/register">没有账号？注册</a>
                <el-button type="primary" @click="submitForm()" class="sbmt-btn">登录</el-button>
              </div>
            </el-form-item>
          </el-form>
          
        </el-card>
      </el-col>
    </el-row>  
  </div>
</template>
<script>
import logo from './c/logo'
import action from './c/action'
import bg from '../../assets/images/login_bg.jpg'
import crypto from 'js-sha256'
import Axios from 'axios';

export default{
  name:"Login",
  components:{
    logo:logo,
    action:action
  },
  data(){
    var notNullValidatior=(rule,value,callback)=>{
      if(value==="")
        switch (rule.field) {
          case 'account':
            callback(new Error('用户名/学号不能为空'))
            break;
          case 'password':
            callback(new Error('密码不能为空'))
            break;
        }
      else callback()
    }

    return{
      loginForm:{
        account:"",
        password:"",
        type:""
      },
      rules:{
        account:[
          {validator:notNullValidatior,trigger:'blur'}
        ],
        password:[
          {validator:notNullValidatior,trigger:'blur'}
        ]
      },
      windowHeight:window.outerHeight,
      src:bg,
    }
  },
  methods:{
    sendSrc(){
      this.$emit('getSrc',this.src)
    },
    allNumber(val){
      let reg=/^[0-9]*$/
      return reg.test(val)
    },
    postData(){
      let data=JSON.parse(JSON.stringify(this.loginForm))
      let u={}
      u.token=''

      if(this.allNumber(data.account))
        data.type='id'
      else data.type='name'

      data.password=crypto.sha256(data.password)
      Axios.post('userLogin',data).then((res)=>{
        if(res.statusText!=='OK')
          this.$message.error('连接失败')
        else if(res.data==='FAULT')
        {
          this.$message.error('用户名或密码错误')
          this.loginForm.password="";
        }
        else
        {
          u.token=res.data
          this.$store.commit('setToken',u)
          this.$message.success('登录成功')
          
          this.$router.push({name:'SIP'})
        }
      })
      
    },
    submitForm(){
      this.$refs['loginForm'].validate((valid) => {
        if (valid) {
            this.postData()
        }
      })
    }
  },
  created(){
    this.sendSrc()
  }
}
</script>
<style>
.form-container{
  background-color:rgba(255,255,255,0.68);
  position: relative;
}

.form-container>*>*{
  margin: 10px 0;
}
.btn-container{
  display: flex;
  justify-content: space-between;
  align-items: center;
}
</style>
