<template>
  <div id="bg">
    <el-row>
      <el-col :span="6">
        <logo></logo>
        <action :hidden='true'></action>
      </el-col>
    </el-row>
    <el-row>
      <el-col :span="6" :offset="18" style="position:relative;">
        <el-card class="form-container">
          <el-input v-model="account" placeholder="用户名"></el-input>
          <el-input v-model="password" placeholder="密码"></el-input>
          <div class="btn-container">
            <a href="register">没有账号？注册</a>
            <el-button type="primary" @click="login()" class="sbmt-btn">登录</el-button>
          </div>
        </el-card>
      </el-col>
    </el-row>  
  </div>
</template>
<script>
import logo from './c/logo'
import action from './c/action'
import bg from '../../assets/images/login_bg.jpg'

export default{
  components:{
    logo:logo,
    action:action
  },
  data(){
    return{
      u:{
        token:""
      },
      account:"",
      password:"",
      src:bg,
    }
  },
  methods:{
    sendSrc(){
      this.$emit('getSrc',this.src)
    },
    login(){
      this.u.token='yhxasdojjaosdoih'
      //TODO: add login function
      this.$store.commit('setToken',this.u)
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
/* #app::after{
  content: "";

	width: 100%;

	height: 100%;

	position: absolute;

	left:0;

	top:0;

	background: inherit;

	filter: blur(15px);

	z-index: -1;
} */
</style>
