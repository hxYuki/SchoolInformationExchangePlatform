import Vuex from 'vuex';
import Vue from 'vue'

Vue.use(Vuex)

const store = new Vuex.Store({
  state:{
    userToken:""
  },
  mutations:{
    setToken:function(state,payload){
      state.userToken=payload.token
    }
  }
})

export default store