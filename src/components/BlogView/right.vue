<template>
  <div class="blogTab">
    <p class="searchTitle">
      <input type="text" placeholder="输入标题关键字" class="NormalInp" v-model="searchText" @keyup.enter="searchTitle"><span class="NormalBtn" @click="searchTitle">搜索</span>
    </p>
    <div class="rightBox">
      <p class="top">分类标签</p>
      <ul class="blogType">
        <li @click="searchTab(0)">全部标签</li>
        <li v-for="(tab, index) in getTabList" :key="index" @click="searchTab(tab.id)">{{tab.tab_name}}</li></ul>
    </div>
    <div class="rightBox">
      <p class="top">最新发布</p>
      <ul class="newList">
        <li v-for="(item, index) in newArticle" :key="index" v-if="index < 5" @click="viewArticle(item.article_id)">{{item.title}}</li>
      </ul>
    </div>
    <div class="rightBox">
      <p class="top">最新评论</p>
      <ul class="newList">
        <li v-for="(item, index) in commentList" :key="index" v-if="index < 8" @click="viewArticle(item.article_id)">
          <span>From：<a>{{item.title}}</a></span>
          <p>{{item.name}}说：{{item.content}}</p>
        </li>
      </ul>
    </div>
  </div>
</template>
<script>
import axios from 'axios'
import { mapGetters, mapActions } from 'vuex'
export default{
  name: 'BlogTab',
  props: ['newArticle'],
  data () {
    return {
      searchText: '',
      commentList: []
    }
  },
  computed: {
    ...mapGetters(['getTabList'])
  },
  methods: {
    ...mapActions(['fetchTabList']),
    searchTab (id) {
      this.searchText = ''
      this.$emit('passTabId', id)
    },
    searchTitle () {
      this.$emit('passTitle', this.searchText)
    },
    viewArticle (id) {
      this.$emit('passArticleId', id)
    }
  },
  mounted () {
    this.fetchTabList()
    axios.get('/comment/getComment').then(res => {
      this.commentList = res.data.data
    })
  }
}
</script>
