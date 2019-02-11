<template>
  <div class="welcomePg">
    <div v-html="backRawHtml"></div>
    <div class="gdimg">
      <img src='../assets/bg.jpg'>
    </div>
    <div class="opentrip">
      <p>
        <router-link to="/blog">进入吴之全博客</router-link>
      </p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Welcome',
  data () {
    return {
      nowHour: new Date().getHours()
    }
  },
  computed: {
    backRawHtml: function () {
      let rawHtml = ''
      if (this.nowHour < 12 && this.nowHour > 8) {
        rawHtml = `<div class='good'>
                <p>早</p>
                <p>Good Moring</p>
                <p>安</p>
              </div>
              <div class='info'>
                <p>你是我清晨的早安</p>
                <p>醒来后的思念</p>
              </div>`
      } else if (this.nowHour < 18 && this.nowHour >= 12) {
        rawHtml = `<div class='good'>
                <p>午</p>
                <p>Good Afternoon</p>
                <p>安</p>
              </div>
              <div class='info'>
                <p>最好的心态是平静</p>
                <p>最好的状态是简单</p>
              </div>`
      } else if (this.nowHour < 24 && this.nowHour >= 18) {
        rawHtml = `<div class='good'>
                <p>晚</p>
                <p>Good Evening</p>
                <p>安</p>
              </div>
              <div class='info'>
                <p>不忘初心</p>
                <p>对寂寞说声晚安！</p>
              </div>`
      } else {
        rawHtml = `<div class='good'>
                <p>晚</p>
                <p>Good Evening</p>
                <p>安</p>
              </div>
              <div class='info'>
                <p>熊猫党，别再看了</p>
                <p>睡觉啦</p>
              </div>`
      }
      return rawHtml
    }
  }
}
</script>

<style lang="scss">
body{
  background: #7babc2;
}
.welcomePg{
  text-align: center;
  padding:30px 0;
  color:#fff;
}
.good p{
  margin: 20px 0;
  font-size: 24px;
}
.info{
  width: 225px;
  margin: auto;
  line-height: 30px;
  border-right: #FFF 1px solid;
  border-left: #FFF 1px solid;
  padding: 10px 0;
}
.gdimg{
  margin: 30px 0 20px 0;
  img{
    width: 200px;
    border: 5px solid #fff;
  }
}
.opentrip{
  width: 200px;
  margin: auto;
  border: #fff 1px solid;
  border-radius: 5px;
  font-size: 20px;
  font-weight: bold;
  line-height: 40px;
  a{
    color: #FFF;
    text-decoration: none;
    display: inline-block;
    width: 100%;
    line-height: 62px;
  }
}
</style>
