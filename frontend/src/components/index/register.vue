<template>
  <div id="bg" class="half">
    <el-row>
      <el-col :span="6">
        
      </el-col>
    </el-row>
    <el-row>
      <el-col :span="20" :offset="2">
        <el-card class="form-container regi-form">
          <el-input placeholder="用户名" v-model="nickname" clearable>*</el-input>
          <el-input placeholder="密码" v-model="password" clearable>*</el-input>
          <el-input placeholder="确认密码" v-model="confiPassword" clearable>*</el-input>
          <el-radio-group v-model="location" @change="show()">
            <el-radio :label="index" v-for="(loca,index) in locations" :key="loca">{{loca.place}}</el-radio>
          </el-radio-group>
          <el-input placeholder="真实姓名" v-model="realname" clearable></el-input>
          <el-input placeholder="学号" v-model="stu_id" clearable></el-input>
          <el-upload
            class="upload"
            drag
            action="">
            <i class="el-icon-upload"></i>
            <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
            <div class="el-upload__tip" slot="tip">只能上传jpg/png文件，且不超过500kb</div>
          </el-upload>
          <el-button @click="register()" type="primary" class="sbmt-btn">注册</el-button>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>
<script>
import logo from './c/logo';
import bg from '../../assets/images/login_bg.jpg'

export default {
  components:{
    logo:logo,
  },
  data(){
    return{
      nickname:'',
      password:'',
      confiPassword:'',
      location:'',
      realname:'',
      stu_id:'',

      locations:{
        0:{place:'dongxiaoqu'},
        1:{place:'beixiaoqu'},
        2:{place:'xixiaoqu'}
      },

      msgbox:{
        
      }
    }
  },
  methods:{
    
  }
}
</script>
<style>
.regi-form input{
  width: 70%;
}
#bg.half{width: 60%;}
</style>
