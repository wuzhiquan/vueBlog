<template>
  <div>
    <input class="NormalInp" v-model="title" placeholder="请输入标题"/>
    <select v-model="tabId">
      <option v-for="tab in tabList" :value="tab.id" :key="tab.id">{{tab.tab_name}}</option>
    </select>
    <editor ref="editor"></editor>
    <button @click="getContent">提交文章</button>
  </div>
</template>

<script>
import Editor from './Editor'
import axios from 'axios'
import Qs from 'qs'
import { Message } from 'element-ui'
export default {
  data () {
    return {
      title: '',
      tabId: 1,
      tabList: []
    }
  },
  components: {
    Editor
  },
  methods: {
    getContent () {
      if (this.title.trim() === '') {
        Message({
          showClose: true,
          message: '请输入标题',
          type: 'error',
          duration: 1000
        })
        return
      }
      if (this.$refs.editor.editorContent.trim() === '') {
        Message({
          showClose: true,
          message: '请输入文章内容',
          type: 'error',
          duration: 1000
        })
        return
      }
      let postData = {
        title: this.title,
        content: this.$refs.editor.editorContent,
        tab_id: this.tabId
      }
      axios.post('/article/createArticle', Qs.stringify(postData)).then(res => {
        Message({
          showClose: true,
          message: '发表文章成功',
          type: 'success',
          duration: 1000
        })
        setTimeout(() => {
          this.$router.go(0)
        }, 1200)
      }).catch(err => {
        console.log(err)
      })
    }
  },
  mounted () {
    axios({method: 'get', url: '/tab/getTab'}).then(res => {
      this.tabList = res.data.data
    })
  }
}
</script>

<style>
</style>
