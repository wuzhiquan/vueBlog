<template>
  <div class="homeContent">
    <div class="picArea">
      <img src="../../assets/photo.jpg">
    </div>
    <div class="blogCon">
      <div class="blogList">
        <ul class="blogList_ul">
          <li v-for="article in articleList" @click="viewArticle(article.article_id)" :key="article.article_id">
            <p class="title">{{article.title}}</p>
            <p class="time">
              <label>发布日期：<span>{{article.time | dateTransform}}</span></label>
              <label>分类：<span>{{article.tab_name }}</span></label>
              <label>阅读量：<span>{{article.see}}</span></label>
            </p>
            <p class="describe" v-html="article.content"></p>
          </li>
          <li style="text-align: center;" v-if="articleList.length == 0">暂无查找结果</li>
        </ul>
        <el-pagination
          background layout="prev, pager, next"
          :total=totalNum :page-size=pageSize @current-change="getArticle" :current-page=currentPage>
        </el-pagination>
      </div>
      <BlogTag :newArticle=newArticle @passTabId="getTabId" @passTitle="getTitle" @passArticleId="viewArticle"></BlogTag>
    </div>
  </div>
</template>
<script>
import '@/scss/blogList.scss'
import BlogTag from './right.vue'
import axios from 'axios'
export default {
  name: 'BlogList',
  data () {
    return {
      articleList: [],
      pageSize: 8, // 每页显示博客列表条数
      totalNum: 0,
      currentPage: 1,
      newArticle: [], // 最新发布博客，最多5条
      searchTab: 0,
      searchTitle: ''
    }
  },
  components: {
    BlogTag
  },
  methods: {
    getArticle (page) {
      this.currentPage = page
      const loading = this.$loading({
        lock: true,
        text: 'Loading',
        spinner: 'el-icon-loading',
        background: 'rgba(0, 0, 0, 0.7)'
      })
      let url = 'article/getArticle?pageNum=' + page + '&pageSize=' + this.pageSize + '&tabId=' + this.searchTab + '&keyword=' + this.searchTitle
      axios.get(url).then(res => {
        this.articleList = res.data.data
        if (page === 1 && this.searchTab === 0 && this.searchTitle === '') {
          this.newArticle = res.data.data
        }
        this.totalNum = res.data.totalNum
        loading.close()
      })
    },
    viewArticle (id) {
      this.$router.push({path: `/blog/detail/${id}`})
    },
    getTabId (tabId) {
      this.searchTab = tabId
      this.searchTitle = ''
      this.getArticle(1)
    },
    getTitle (title) {
      this.searchTitle = title
      this.searchTab = 0
      this.getArticle(1)
    }
  },
  mounted () {
    this.getArticle(1)
  }
}
</script>

<style>
  .el-pagination{
    text-align: right;
  }
</style>
