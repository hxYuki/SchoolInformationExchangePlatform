<template>
  <div class="action" :data-tok="lInfo">
    <template v-if="loggedin===false">
      <a href="/#/register">注册</a>
      <a href="/#/login">登录</a>
    </template>
    <template v-else>
      <el-dropdown>
          <a class="el-dropdown-link" :href="'/#/profile/'+user.userid">
            {{user.username+'瓜皮'}}<i class="el-icon-arrow-down"></i>
          </a>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item @click="logout()">退出</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </template>
  </div>
</template>

<script>
export default{
  data(){
    return{
      loggedin:false,
      user:null,
    }
  },
  methods:{
    updateInfo:function(token){
      let t={}
      t.userid1=''
      t.username1=''

      if(token!==''){
        this.loggedin=true
        //TODO: parse the token (in the following parts)
        t.userid1='balabal'
        t.username1='balaba'
        this.user=t
      }
      else{
        this.loggedin=false
        t.userid1=''
        t.username1=''
        this.user=t
      }
      return token
    }
  },
  computed: {
    lInfo:function(){
      return this.$store.state.userToken,this.updateInfo(this.$store.state.userToken)
    }
  },
}
</script>
<style>
.action a,.action div{float: right; margin-left: 15px}
</style>
