<template>
  <div id="bg">
    <el-container>
      <el-header>
        <el-row>
          <el-col :span="6">
            <logo></logo>
          </el-col>
          <el-col :span="1" :offset="13">
            <a href="putaway">SELL</a>
          </el-col>
          <el-col :span="4">
            <action></action>
          </el-col>
        </el-row>
      </el-header>
      <el-container>
        <el-aside>
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
        <el-main>
          <el-card class="box-card">
            <div slot="header">
              <el-row>
                <el-col :span="10">
                  <el-input placeholder="搜索" clearable>
                    <el-button slot="append" icon="el-icon-search" @click="search()"></el-button>
                  </el-input>
                </el-col>
                <el-col :span="10" :offset="3">
                  <el-button type="text">时间<i class="el-icon-sort"></i></el-button>
                  <el-button type="text">热度<i class="el-icon-sort"></i></el-button>
                  <el-button type="text">价格<i class="el-icon-sort"></i></el-button>
                  <el-button icon="el-icon-circle-close-outline" type="text" circle @click="clearArrangeCondition()"></el-button>
                </el-col>
              </el-row>
            </div>
            <div class="item-container">
              <a :href="'item/'+item.id"  v-for="item in itemList" :key="item">
                <el-card :body-style="{ padding: '0px' }">
                  <img :src="item.pic" class="image">
                  <div style="padding: 14px;">
                    <span>{{item.name}}</span>
                    <div class="bottom clearfix">
                      <div class="description">{{item.description}}</div>
                    </div>
                  </div>
                </el-card>
              </a>
              
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

export default {
  components:{
    logo:logo,
    action:action
  },
  data(){
    return{
      restrictTree:[
        {
          label:"location",
          children:[
            {label:"dongxiaoqu"},
            {label:"beixiaoqu"},
            {label:"xixiaoqu"}
          ]
        },
        {
          label:"class",
          children:[
            {label:"1"},
            {label:"2"},
            {label:"3"}
          ]
        }
      ],
      itemList:{
        0:{
          pic:"",
          name:"item1",
          id:"",
          description:"11111"
        },
        1:{
          pic:"",
          name:"item2",
          id:"",
          description:"22222"
        }
      },
    }
  }
}
</script>

<style>
.item-container{
  display: flex;
  flex-wrap: wrap;
  justify-content: flex-start;
}
.item-container>a{
  display: block;
  margin: 15px;
  width: 150px;
  height: 200px;
}
.description{
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
}
</style>
