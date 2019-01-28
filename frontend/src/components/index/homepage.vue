<template>
  <div id="bg" class="homepage">
    <el-container>
      <el-header>
        <el-row>
          <el-col :span="6">
            <logo></logo>
          </el-col>
          <el-col :span="10" :offset="1" class="search">
            <el-input placeholder="点击搜索" clearable>
              <el-button slot="append" icon="el-icon-search" @click="search()"></el-button>
            </el-input>
          </el-col>
          <el-col :span="4" :offset="3">
            <action></action>
          </el-col>
        </el-row>
      </el-header>
      <el-main>
        <el-container>
          <el-aside>
            <a v-for="(value, key) in optionList" :key="key" :value="value" class="text item optL" :href="value">
              <el-card>{{key}}</el-card>
            </a>
          </el-aside>
          <el-main>
            <el-card class="box-card" :header="{class:'new-header'}">
              <div slot="header" class="clearfix">
                <span>当前最新</span>
                <el-button style="float: right; padding: 3px 0" type="text" @click="refresh()">刷新 <i class="el-icon-refresh"></i></el-button>
              </div>
              <el-carousel :interval="4000" type="card" height="200px">
                <el-carousel-item v-for="(value,key) in newestList" :key="key" :value="value" >
                  <a :href="value" class="img-item"><span>{{ key }}</span></a>
                </el-carousel-item>
              </el-carousel>
            </el-card>
          </el-main>
        </el-container>
        <el-card>
          <div slot="header" class="clearfix">
            <span>人群熙攘之所</span>
            <a style="float: right; padding: 3px 0" href="">更多 <i class="el-icon-more"></i></a>
          </div>
          <div class="item-container">
            <a class="item" v-for="(value,key) in hottestList" :key="key">
              <el-card :body-style="{ padding: '0px' }">
                <img :src="value.pic" class="image">
                <div style="padding: 14px;">
                  <span>{{value.name}}</span>
                </div>
              </el-card>
            </a>
          </div>
        </el-card>
        <el-card>
          <div slot="header" class="clearfix">
            <span>无人涉足之地</span>
            <a style="float: right; padding: 3px 0" href="">更多 <i class="el-icon-more"></i></a>
          </div>
          <div class="item-container">
            <a class="item" v-for="(value,key) in coolList" :key="key">
              <el-card :body-style="{ padding: '0px' }" >
                <img :src="value.pic" class="image">
                <div style="padding: 14px;">
                  <span>{{value.name}}</span>
                </div>
              </el-card>
            </a>
          </div>
        </el-card>
      </el-main>
      <el-footer></el-footer>
    </el-container>
  </div>
</template>

<script>
import logo from './c/logo';
import action from './c/action';

export default{
  name:'bg',
  components:{
    logo:logo,
    action:action
  },
  data(){
    return{
      
      optionList:[
        {opt1:'index/index'},
        {opt2:'index/balabal'}

      ],
      newestList:[
        {item1:'index/index'},
        {item2:'index/balabala'}
      ],
      hottestList:[
        {
          name:'hot1',
          id:'',
          pic:''
        },
        {
          name:'hot2',
          href:'',
          pic:''
        }
      ],
      coolList:[
        {
          name:'cool1',
          id:'',
          pic:''
        },
        {
          name:'cool2',
          href:'',
          pic:''
        }
      ]
    }
  }
}
</script>

<style>
  a,a:hover{text-decoration: none;}
  @media screen and (min-width:768px) {
    #bg{
      width: 80%;
      margin: 0 auto;
    }
  }
  #bg.homepage{margin-top: 60px;}
  .el-main{
    padding: 0;
  }
  
  .optL,.optL div{
    height: 20%;
  }
  .clearfix:before,
  .clearfix:after {
    display: table;
    content: "";
  }
  .clearfix:after {
    clear: both
  }
  .el-card{text-align: left}
  .new-header{padding-top:9px;padding-bottom: 9px; }
  .img-item{
    display: inline-block;
    text-align: center;
    vertical-align: bottom;
  }
  .el-carousel__item a {
    color: #475669;
    font-size: 14px;
    opacity: 0.75;
    height: 175px;
    margin: 0 15px;

  }
  .el-carousel__item a span{
    display: none;
    top: 75%;
    position: relative;
  }
  .el-carousel__item.is-active span{display: block}
  .el-carousel__item:nth-child(2n) {
    background-color: #99a9bf;
  }
  
  .el-carousel__item:nth-child(2n+1) {
    background-color: #d3dce6;
  }
  
  .el-header{padding: 0;}
</style>
