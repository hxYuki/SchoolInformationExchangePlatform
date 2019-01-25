<template>
<div id="app" :style="{'background-image':'url('+src+')'}">
    <router-view @getSrc="imgSrc"/>
</div>
</template>

<script>
import axios from 'axios'


axios.defaults.baseURL='http://localhost/schoolpublish/php/public/index.php'

export default{
  name:'app',
  components:{},
  data(){
    return{
      src:""
    }
  },
  methods:{
    imgSrc: function(isrc){
      this.src=isrc
    }
  },
  created(){
    console.log(this.$store.state.userToken);
    
  },
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
  
  background-size: cover;
}
body{min-height: 100%;margin: 0;}
</style>
