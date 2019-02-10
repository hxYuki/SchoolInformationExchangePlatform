<template>
  <div class="action" :data-tok="lInfo">
    <template v-if="loggedin===false">
      <a href="/#/register">注册</a>
      <a href="/#/login">登录</a>
    </template>
    <template v-else>
      <el-dropdown>
          <a class="el-dropdown-link" :href="'/#/profile/'+user.userid">
            {{user.username}}<i class="el-icon-arrow-down"></i>
          </a>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item><button @click="logout">退出</button></el-dropdown-item>
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
      t.userid=''
      t.username=''

      if(token!==''){
        this.loggedin=true
        
        let spl = token.split(';')

        t.userid=spl[0]
        t.username=spl[1]
        this.user=t
      }
      else{
        this.loggedin=false
        t.userid=''
        t.username=''
        this.user=t
      }
      return token
    },
    logout(){
      let d={}
      d.token=''
      this.$store.commit('setToken',d)
      this.$router.push('./login')
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
