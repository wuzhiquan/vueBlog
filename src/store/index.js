import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

const state = {
  tabList: []
}
const getters = {
  getTabList: state => state.tabList
}
const mutations = {
  setTabList (state, list) {
    state.tabList = list
  }
}
const actions = {
  fetchTabList (context) {
    axios.get('/tab/getTab').then(res => {
      let result = res.data.data
      context.commit('setTabList', result)
    })
  }
}

export default new Vuex.Store({
  state,
  getters,
  mutations,
  actions
})
