<template>
  <div id="app">
    <p>{{ message }}</p>
    <p>{{ getName() }}</p>
  </div>
</template>

<script>
import axios from 'utils/apiClient';

export default {
  data: function () {
    return {
      message: "SHoopie!",
      name: '',
    }
  },
  mounted: () => {
    // const vm = this;

    // axios.get('/landing/test')
    //   .then(function(res) {
    //     vm.name = res.name;
    //     console.log(res.name)
      
    //     // console.log(res.data);
    //   });
  },
  methods: {
    getName: function() {

      axios.get('/landing/test')
        .then((xhr) => {
          this.name = xhr.data.name;

        });
        return this.name;
    }
  },
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
