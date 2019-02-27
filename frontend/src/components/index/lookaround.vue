<template>
  <div id="bg">
    <el-container>
      <el-header>
        <el-row>
          <el-col :span="6">
            <logo></logo>
          </el-col>
          <el-col :span="1" :offset="13">
            <a href="#/putaway">SELL</a>
          </el-col>
          <el-col :span="4">
            <action></action>
          </el-col>
        </el-row>
      </el-header>
      <el-container>
        <el-aside style="padding-left: 20px">
          <el-card class="box-card">
            <div slot="header" class="clearfix">
              <span>筛选</span>
              <el-button style="float: right; padding: 3px 0" circle type="text" icon="el-icon-circle-close-outline" @click="clearTypeCondition()"></el-button>
            </div>
            <el-tree 
              :data="restrictTree"
              show-checkbox
              check-on-click-node>
            </el-tree>
          </el-card>
        </el-aside>
        <el-main style="padding-top: 0;padding-left: 0">
          <el-card class="box-card">
            <div slot="header">
              <el-row>
                <el-col :span="10">
                  <el-input v-model="searchKey" placeholder="搜索" @keyup.enter.native="search()" clearable autofocus>
                    <el-button slot="append" icon="el-icon-search" @click="search()"></el-button>
                  </el-input>
                </el-col>
                <el-col :span="10" :offset="3">
                  <el-button @click="switchOrder('time')" type="text">时间<i :class="{'el-icon-sort':orderCondition.time==='unset','el-icon-sort-up':orderCondition.time==='asc','el-icon-sort-down':orderCondition.time==='desc'}"></i></el-button>
                  <el-button @click="switchOrder('view')" type="text">热度<i :class="{'el-icon-sort':orderCondition.view==='unset','el-icon-sort-up':orderCondition.view==='asc','el-icon-sort-down':orderCondition.view==='desc'}"></i></el-button>
                  <el-button @click="switchOrder('price')" type="text">价格<i :class="{'el-icon-sort':orderCondition.price==='unset','el-icon-sort-up':orderCondition.price==='asc','el-icon-sort-down':orderCondition.price==='desc'}"></i></el-button>
                  <el-button icon="el-icon-circle-close-outline" type="text" circle @click="clearArrangeCondition()"></el-button>
                </el-col>
              </el-row>
            </div>
            <div class="item-container">
              <a :href="'#/item?id='+item.id"  v-for="item in itemList" :key="itemList.indexOf(item)">
                <el-card :body-style="{ padding: '0px',height:'200px' }" shadow="hover">
                  <img :src="item.pic" class="image">
                  <div style="padding: 14px;">
                    <span>{{item.title}}</span>
                    <div class="bottom clearfix">
                      <div class="description">{{item.description}}</div>
                    </div>
                  </div>
                </el-card>
              </a>
              
            </div>
            <div class="">
              <el-pagination
                      @current-change="changePage"
                      :current-page="page"
                      :page-size="15"
                      layout="total, prev, pager, next, jumper"
                      :total="listCount">
              </el-pagination>
            </div>
          </el-card>
        </el-main>
      </el-container>
      <el-footer></el-footer>
    </el-container>
  </div>
</template>

<script>
import logo from './c/logo';
import action from './c/action';
import Axios from 'axios';

export default{
  components:{
    logo:logo,
    action:action
  },
  data(){
    return{
      restrictTree:[
        {
          label:"位置",
          children:[
            {label:"获取失败"}
          ]
        },
        {
          label:"热门标签",
          children:[
            {label:"获取失败"}
          ]
        }
      ],
      itemList:[],
      listCount:0,
      searchKey:"",
      page:1,
      orderCondition:{
        time:"unset",
        view:"unset",
        price:"unset"
      },
    }
  },
  methods:{
    search(){
      this.$router.push({query:{page:this.page,search:this.searchKey}})
      this.fetchItemList()
    },
    fetchItemList: function () {
      let po = {}
      for (let key in this.orderCondition) {
        if (this.orderCondition[key] !== 'unset')
          po[key] = this.orderCondition[key]
      }
      po.keyword = this.searchKey
      po.page = this.page

      return Axios.post('getItemList', {queryList: JSON.stringify(po)}).then(res => {
        if (res.status === 500) {
          this.$message.error('服务器错误')
          return false
        }
        if (res.status !== 200) {
          this.$message.error('网络错误')
          return false
        }
        this.itemList = res.data.list
        this.listCount = res.data.list_count
      })
    },
    switchOrder(type){
      switch (this.orderCondition[type]) {
        case 'unset':
          this.orderCondition[type]='asc'
          break;
        case 'asc':
          this.orderCondition[type]='desc'
          break;
        case 'desc':
          this.orderCondition[type]='asc'
          break;
      }

      this.fetchItemList()
    },
    clearArrangeCondition(){
      for(let key in this.orderCondition){
        this.orderCondition[key]='unset'
      }

      this.fetchItemList()
    },
    changePage(val){
      this.page=val
      this.search()
    },
    getRestrict(){

      Axios.post('fetchLocation').then(res=>{
        let t=[]
        for(let el in res.data){
          t.push({label:res.data[el]})
        }
        this.restrictTree[0].children=t
      })

      Axios.post('getTagSuggestion').then(res=>{
        let t=[]
        for(let el in res.data){
          t.push({label:res.data[el]})
        }
        this.restrictTree[1].children=t
      })
    }
  },
  created(){
    let p=parseInt(this.$route.query.page)
    this.searchKey=this.$route.query.search
    this.page=p?p:1

    this.getRestrict()
  },
  beforeMount(){
    this.fetchItemList()
  },
  computed:{

  }
}
</script>

<style>
.item-container{
  display: flex;
  flex-wrap: wrap;
  justify-content: flex-start;
}
.item-container a,.item-container a:link,.item-container a:hover,.item-container a:visited,.item-container a:active{
  display: block;
  margin: 15px;
  width: 150px;
  height: 200px;

  color: inherit;
  text-decoration: inherit;
}
.description{
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
}
</style>
