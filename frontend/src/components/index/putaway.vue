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
    <div class="item-form">
      <el-form :label-position="top">
        <div class="flex-content">
          <el-upload
            class="upload"
            drag
            multiple
            :auto-upload="false"
            action="">
            <i class="el-icon-plus avatar-uploader-icon"></i>
            <div class="el-upload__tip" slot="tip">添加物品图片</div>
          </el-upload>
          <div class="oth-info">
            <el-form-item label="名称">
              <el-input></el-input>
            </el-form-item>
            <el-form-item label="标签">
              <div style="display:inline-block;width:100%;text-align:left">
                <el-tag
                  :key="tag"
                  v-for="tag in dynamicTags"
                  closable
                  :disable-transitions="false"
                  @close="handleClose(tag)">
                  {{tag}}
                </el-tag>
                <el-autocomplete
                  class="input-new-tag"
                  v-if="inputVisible"
                  v-model="inputValue"
                  ref="saveTagInput"
                  size="small"
                  @keyup.enter.native="handleInputConfirm"
                  @blur="handleInputConfirm"
                >
                </el-autocomplete>
                <el-button v-else class="button-new-tag" size="small" @click="showInput">+ New Tag</el-button>
              </div>
            </el-form-item>
            <el-form-item label="期望价格">
              <el-input></el-input>
            </el-form-item>
            <el-form-item label="描述">
              <el-input type=textarea autosize></el-input>
            </el-form-item>
            
          </div>
        </div>
        <el-form-item>
          <el-button>取消</el-button>
          <el-button type="primary" @click="onSubmit">上架</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>
<script>
import logo from './c/logo';

export default {
  components:{
    logo:logo,
  },
  data() {
    return {
      dynamicTags: ['标签一', '标签二', '标签三'],
      inputVisible: false,
      inputValue: ''
    };
  },
  methods: {
    handleClose(tag) {
      this.dynamicTags.splice(this.dynamicTags.indexOf(tag), 1);
    },

    showInput() {
      this.inputVisible = true;
      this.$nextTick(_ => {
        this.$refs.saveTagInput.$refs.input.focus();
      });
    },

    handleInputConfirm() {
      let inputValue = this.inputValue;
      if (inputValue) {
        this.dynamicTags.push(inputValue);
      }
      this.inputVisible = false;
      this.inputValue = '';
    }
  }
}
</script>
<style>
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  line-height: 178px;
  text-align: center;
}
.el-tag + .el-tag {
  margin-left: 10px;
}
.button-new-tag {
  margin-left: 10px;
  height: 32px;
  line-height: 30px;
  padding-top: 0;
  padding-bottom: 0;
}
.input-new-tag {
  width: 90px;
  margin-left: 10px;
  vertical-align: bottom;
}
.item-form{
  width: 80%;
  margin: 0 auto;
}
.upload{
  width: 35%;
}
.el-upload-dragger{
  width: unset;
  height: unset;
}
.flex-content{
  display: flex;
  justify-content: space-around;
}
.oth-info{
  width: 55%;
}
</style>
