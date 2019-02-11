// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import axios from 'axios'
import store from './store'
import { Loading, Pagination } from 'element-ui'
import '@/scss/common.scss'

Vue.use(Loading)
Vue.use(Pagination)

axios.defaults.baseURL = process.env.NODE_URL
// axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded'

Vue.config.productionTip = false

Vue.filter('dateTransform', function (value) { // 全局方法 Vue.filter() 注册一个自定义过滤器,必须放在Vue实例化前面
  let date = new Date(value)
  let year = date.getFullYear()
  let month = date.getMonth() + 1
  let nowDate = date.getDate() < 10 ? '0' + date.getDate() : date.getDate()
  let hour = date.getHours() < 10 ? '0' + date.getHours() : date.getHours()
  let min = date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes()
  month = month < 10 ? ('0' + month) : month
  return (year + '-' + month + '-' + nowDate + ' ' + hour + ':' + min)
})

router.beforeEach((to, from, next) => {
  /* 路由发生变化修改页面title */
  if (to.meta.title) {
    document.title = to.meta.title
  }
  next()
})

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
})
