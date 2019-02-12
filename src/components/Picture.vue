<template>
  <div>
  </div>
</template>

<script>
import { Message } from 'element-ui'
import '@/scss/editor.scss'
export default {
  mounted () {
    Message({
      showClose: true,
      message: '敬请期待……',
      duration: 2000
    })
  }
}
</script>
<style>
</style>
