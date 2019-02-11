<template>
  <div class="homePage">
    <header>
      <h3>精&nbsp;&nbsp;灵&nbsp;&nbsp;王&nbsp;&nbsp;座</h3>
      <nav>
        <ul>
          <li v-for="menu in menuList" :key="menu.id"><router-link :to="{name: menu.routeName}">{{menu.cnName}}</router-link></li>
        </ul>
      </nav>
    </header>
    <router-view/>
    <footer><p>Copyright ©2019-{{year}} wuzhiquan Personal Blog Website</p></footer>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  name: 'Index',
  data () {
    return {
      menuList: []
    }
  },
  computed: {
    year () {
      return new Date().getFullYear()
    }
  },
  mounted () {
    axios.get('/tab/getMenu').then(res => {
      this.menuList = res.data.data
    })
  }
}
</script>
<style>
.homePage{
  max-width: 1200px;
  margin: 0 auto;
  background:#fff;
}
</style>
