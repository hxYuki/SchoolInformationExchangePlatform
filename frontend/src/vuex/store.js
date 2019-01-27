import Vuex from 'vuex';
import Vue from 'vue'

Vue.use(Vuex)

const store = new Vuex.Store({
  state:{
    userToken:"",
    userIp:"",
    userRegion:""
  },
  mutations:{
    setToken:function(state,payload){
      state.userToken=payload.token
    },
    setPos:function(state,payload){
      state.userIp=payload.cip
      state.userRegion=payload.cname
    }
  }
})

export default store