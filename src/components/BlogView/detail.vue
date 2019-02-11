<template>
  <div class="homeContent">
    <div class="blogCon">
      <div class="articleDetail" v-for="item in article" :key="item.article_id">
        <h3 class="title">{{item.title}}</h3>
        <p class="time">
          <label>发布日期：<span>{{item.time | dateTransform}}</span></label>
          <label>分类：<span>{{item.tab_name}}</span></label>
          <label>阅读量：<span>{{see}}</span></label>
          <label>评论：<span>{{commentArr.length}}</span></label>
        </p>
        <div class="articleContent" v-html="item.content"></div>
      </div>
      <p class="jump">上一篇：
        <label v-if="prevArticle.length == 0">没有了</label>
        <span v-else @click="jumpTo(prevArticle[0].article_id)">{{prevArticle[0].title}}</span>
      </p>
      <p class="jump">下一篇：
        <label v-if="nextArticle.length == 0">没有了</label>
        <span v-else @click="jumpTo(nextArticle[0].article_id)">{{nextArticle[0].title}}</span>
      </p>
      <ul class="commentList" v-if="commentArr.length > 0">
        <li v-for="comment in commentArr" :key="comment.id">
          <p class="prefix">
            <label>评论人：<span>{{comment.name}}</span></label>
            <label class="right">评论日期：<span>{{comment.time | dateTransform}}</span></label>
          </p>
          <p class="comment">{{comment.content}}</p>
        </li>
      </ul>
      <div class="commentArea">
        <p>
          <label>请输入昵称：<input v-model="commentName" class="NormalInp" placeholder="请输入您的昵称" /></label>
          <label>联系方式(选填)：<input v-model="commentContact" class="NormalInp" placeholder="请输入您的联系方式（仅交流，不展示）" /></label>
        </p>
        <textarea v-model="commentContent" placeholder="请输入评论"></textarea>
        <p><span class="NormalBtn" @click="saveComment">保存评论</span></p>
      </div>
    </div>
  </div>
</template>
<script>
import '@/scss/blogDetail.scss'
import axios from 'axios'
import Qs from 'qs'
import { Message } from 'element-ui'
export default{
  name: 'BlogDetail',
  data () {
    return {
      articleId: this.$route.params.id,
      commentArr: [],
      article: [],
      prevArticle: [],
      nextArticle: [],
      see: 0,
      commentName: '',
      commentContent: '',
      commentContact: ''
    }
  },
  methods: {
    jumpTo (id) {
      this.$router.push({path: `/blog/detail/${id}`})
    },
    saveComment () {
      if (this.commentName.trim() === '') {
        Message({
          showClose: true,
          message: '请输入您的昵称',
          type: 'error',
          duration: 1000
        })
        return
      }
      if (this.commentContent.trim() === '') {
        Message({
          showClose: true,
          message: '请输入您的评论',
          type: 'error',
          duration: 1000
        })
        return
      }
      let postData = {
        name: this.commentName,
        content: this.commentContent,
        article_id: this.articleId,
        contact: this.commentContact
      }
      axios.post('/comment/createComment', Qs.stringify(postData)).then(res => {
        this.commentName = ''
        this.commentContent = ''
        this.commentContact = ''
        Message({
          showClose: true,
          message: '发表评论成功',
          type: 'success',
          duration: 1000
        })
        setTimeout(() => {
          postData['time'] = new Date()
          this.commentArr.unshift(postData)
        }, 1200)
      })
    }
  },
  mounted () {
    const loading = this.$loading({
      lock: true,
      text: 'Loading',
      spinner: 'el-icon-loading',
      background: 'rgba(0, 0, 0, 0.7)'
    })
    axios.get('article/getArticleInfo?id=' + this.articleId).then(res => {
      let result = res.data
      this.commentArr = result.comment
      this.article = result.data
      this.prevArticle = result.prevData
      this.nextArticle = result.nextData
      document.title = this.article[0].title
      loading.close()
      // 更新浏览量
      let newSee = result.data[0].see + 1
      axios.get('article/updateSee?articleId=' + this.articleId + '&see=' + newSee).then(res => {
        this.see = newSee
      })
    })
  },
  watch: {
    '$route' (to, from) {
      this.$router.go(0) // 在history记录中前进或者后退val步，当val为0时刷新当前页面
    }
  }
}
</script>
