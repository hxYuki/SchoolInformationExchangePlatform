<template>
  <div id="bg">
    <el-container>
      <el-header class="background" style="height: 300px;">
        <el-row>
          <el-col :span="4" :offset="2">
            <logo></logo>
          </el-col>
          <el-col :span="2" :offset="14">
            <el-button type="danger" @click="deleteAccountConfirm()">注销账户</el-button>
          </el-col>
        </el-row>
      </el-header>
      <el-main class="profile-form" style="overflow:unset">
        <div class="devide" :style="'width:'+screenWidth+'px'"></div>
        <el-form label-width="90px" label-position="left">
          <div class="first-col">
            <div class="iconbox"><img :src="icon" alt=""></div>
            <el-form-item>
              <el-input v-model="name"></el-input>
            </el-form-item>
            <el-button class="suffix-btn" @click="verifyPwd()">修改密码</el-button>
            <div class="suffix-action">
              <template v-if="editMode">
                <el-button icon="el-icon-check" circle></el-button>
                <el-button icon="el-icon-close" circle></el-button>
              </template>
              <template v-else>
                <el-button icon="el-icon-edit" circle></el-button>
              </template>
            </div>
          </div>
          <el-form-item label="真实姓名">
            <el-input></el-input>
          </el-form-item>
          <el-form-item label="学号">
            <el-input></el-input>
          </el-form-item>
          <el-form-item label="校区">
            <el-radio-group v-model="location" @change="show()">
              <el-radio :label="index" v-for="(loca,index) in locations" :key="loca">{{loca.place}}</el-radio>
            </el-radio-group>
          </el-form-item>
          <el-form-item label="历史记录">
            <el-input type="textarea"></el-input>
          </el-form-item>
          <el-form-item label="评论">
            <el-input type="textarea"></el-input>
          </el-form-item>
        </el-form>
      </el-main>
    </el-container>
  </div>
</template>
<script>
import icon from '../../assets/images/logo.png';
import logo from './c/logo';

export default {
  components:{
    logo:logo,
  },
  data(){
    return{
      icon:icon,
      editMode:false,
      screenWidth:document.body.clientWidth,
    }
  },
  
}
</script>
<style>
.profile-form{
  width: 80%;
  margin: 0 auto;
}
.devide{overflow: hidden;}
.devide::before{
  content: "";
  position: absolute;
  left: 0;
  border-top: 1px solid black;
  width: 100%;
}
.profile-form .el-input,.profile-form .el-textarea{
  width: 60%;
  display: block;
}
.first-col{ position: relative;}
.iconbox{
  position: absolute;
  width: 80px;
  height: 80px;
  border:solid 1px black;
  border-radius: 80px;
  overflow: hidden;
  background-color:white; 
}
.first-col .iconbox{
  left: 0;
  top: -40px;
}
.first-col .iconbox img{
  width: 100%;
  height: 100%;
}
.first-col .suffix-btn{
  position: absolute;
  top: -40px;
  right: 10%;
}
.first-col .suffix-action{
  position: absolute;
  top: 0;
  right: 10%;
}
</style>

