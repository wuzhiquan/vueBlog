<template>
    <div class="editorWrap">
        <span class="NormalBtn" @click="toggleFullscreen" :class="{'fullScreenTop': fullScreen}">{{screenText}}</span>
        <div ref="editor" style="text-align:left" :class="{'fullscreen-editor': fullScreen}"></div>
    </div>
</template>
<script>
import E from 'wangeditor'
export default {
  name: 'editor',
  data () {
    return {
      editorContent: '',
      fullScreen: false
    }
  },
  computed: {
    screenText () {
      return this.fullScreen ? '退出全屏' : '全屏'
    }
  },
  methods: {
    toggleFullscreen () {
      this.fullScreen = !this.fullScreen
    }
  },
  mounted () {
    var editor = new E(this.$refs.editor)
    editor.customConfig.onchange = (html) => {
      this.editorContent = html
    }
    editor.customConfig.uploadImgShowBase64 = true
    editor.customConfig.uploadImgMaxSize = 0.1 * 1024 * 1024 // 最大0.1M
    editor.customConfig.zIndex = 10
    editor.create()
  }
}
</script>
<style lang="scss">
.editorWrap{
  background: #fff;
  position: relative;
  .NormalBtn{
    position:absolute;
    right:6px;
    top:3px;
    line-height: 26px;
    height:26px;
    z-index: 10000;
  }
  .fullScreenTop{
    top: -28px;
  }
}
.fullscreen-editor {
  position: fixed !important;
  width: 100% !important;
  height: 100% !important;
  left: 0px !important;
  top: 0px !important;
  background-color: white;
  z-index: 9999;
}
.fullscreen-editor .w-e-text-container {
  width: 100% !important;
  height: 95% !important;
}
</style>
