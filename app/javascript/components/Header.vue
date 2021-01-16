<template>
<img class='logo' v-bind:src="require('images/shoppies.png')">
</template>

<script>

import railsImage from 'images/shoppies.png';

export default {
  name: 'Header',
  data() {
    return {
      railsImage,
    }
  }
}
</script>

<style scoped>
  @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap');

.logo {
  width: 25%;
  display: block;
  margin-left: auto;
  margin-right: auto;
  padding-top: 5vh;
}
</style>