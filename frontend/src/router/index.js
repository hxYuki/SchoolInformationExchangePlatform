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
    {path:'/', component: homepage},
    {path:'/walkaround',component: lookaround},
    {path:'/login',component:login},
    {path:'/register',component:register},
    {path:'/profile',component:profile},
    {path:'/item',component:item},
    {path:'/putaway',component:putaway},
  ]
})
