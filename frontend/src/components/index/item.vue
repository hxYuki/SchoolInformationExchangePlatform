<template>
  <div id="bg">
    <el-row>
      <el-col :span="4" :offset="2">
        <logo></logo>
      </el-col>
      <el-col :span="4" :offset="12">
        <action></action>
      </el-col>
    </el-row>
    <div class="item-detail" style="text-align:left">
      <el-card>
        <div slot="header" class="clearfix">
          <span>物品</span>
        </div>
        <div class="item-container">
          <el-carousel height="300px" class="item-pic">
            <el-carousel-item v-for="(img,key) in item.images" :key="key">
              <img :src="img" alt="">
            </el-carousel-item>
          </el-carousel>
          <div class="description">
            <h2>{{item.title}}</h2>
            <div class="tags">
              <el-tag v-for="(i,key) in item.tags" :key="key"><a href="">{{i}}</a></el-tag>
            </div>
            <p class="description-content">{{item.description?item.description:"暂无描述"}}</p>
            <h5>{{item.price}}</h5>
            <el-button type="danger">LOCK</el-button>
            
          </div>
        </div>
      </el-card>
    </div>
    <div class="comments">
      <h3 class="title">卖家</h3>
      <h3 class="rate">
        <div>
          <el-rate
            v-model="seller.user_marks"
            disabled
            show-score
            text-color="#ff9900"
            score-template="{value}">
          </el-rate>
        </div>
        <a :href="'/#/profile?id='+seller.user_id">{{seller.user_nickname}}</a>
        <div class="iconbox"><img :src="seller.user_icon" alt=""></div>
      </h3>
      <div class="main-comment">
        <div class="comment-content">
          <p class="content"></p>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import logo from './c/logo'
import action from './c/action'
import Axios from 'axios';

export default{
  components:{
    logo:logo,
    action:action,
  },
  data(){
    return{
      item:{},
      seller:{},
      rate:0,

      itemId:'',
    }
  },
  methods: {
    fetchItem(id){
      return Axios.post('getItem',{itemId:id}).then(res=>{
        if(res.status!=200){
          this.$message.error('网络错误')
          return false
        }else{
          this.item=res.data
        }
      })
    },
    fetchUser(id){
      return Axios.post('userGetAsSeller',{userId:id}).then(res=>{
        if(res.status!=200){
          this.$message.error('网络错误')
          return false
        }else{
          this.seller=res.data
        }
      })
    }
  },
  created() {
    this.fetchItem(this.$route.query.id).then(()=>{
      this.fetchUser(this.item.publisher_id)
    })

  },
}
</script>
<style>
.item-detail, .comments{
  width: 80%;
  margin: 0 auto;
}
.item-detail .item-container{
  min-width: 625px;
  display: flex;
  flex-wrap: nowrap;
  justify-content: space-around;
}
.item-detail .tags>*{
  min-width: 40px;
  text-align: center;
  margin-right: 4px;
}
.item-detail a,a:visited,a:hover,a:link,a:active{
  color: inherit;
  text-decoration: inherit;
}
.item-pic{
  width: 250px;
}
.description{
  position: relative;
  width: 60%;
}
.description h2{margin-top: 0}
.description h5{
  position: absolute;
  margin-top: 0;
  bottom: 5%;
}
.description button{
  position: absolute;
  right: 5px;
  bottom: 5%;
}
.description .description-content{
  word-wrap: break-word;
  height: 45%;
}
.comments{position: relative;}
.comments .title{
  text-align: left;
}
.comments .rate{
  position: relative;
  display: flex;
  justify-content: space-between;
  width: 80%;
  margin-bottom: 0;
}
.comments .iconbox{
  position: absolute;
  right: -105px;
  bottom: -40px;
}
.comments .main-comment{
  /* border: 1px solid black; */
  border-bottom: none;
  border-radius: 6px 6px 0 0;
  min-height: 200px;
  box-shadow: 0 2px 12px 0 rgba(0,0,0,.2);
}
.comments p{
  margin: 0;
  padding-top: 45px;
}
</style>
