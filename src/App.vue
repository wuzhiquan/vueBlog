<template>
  <div id="app">
    <transition name="fade">
      <router-view/>
    </transition>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style>
.fade-enter-active,.fade-leave-active{
  transition: .3s all ease;
}
.fade-enter, .fade-leave-to{
  opacity: 0;
}
</style>
