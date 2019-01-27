import Vue from 'vue'
import Router from 'vue-router'
import homepage from '@/components/index/homepage';
import lookaround from '@/components/index/lookaround';
import login from '@/components/index/login';
import register from '@/components/index/register';
import profile from '@/components/index/profile';
import item from '@/components/index/item';
import putaway from '@/components/index/putaway';

Vue.use(Router)

export default new Router({
  routes: [
    {path:'/',name:"SIP",component: homepage},
    {path:'/walkaround',name:"Look Around",component: lookaround},
    {path:'/login',name:"Login",component:login},
    {path:'/register',name:"Register",component:register},
    {path:'/profile',name:"Profile",component:profile},
    {path:'/item',name:"Item",component:item},
    {path:'/putaway',name:"Put Away",component:putaway},
  ]
})
