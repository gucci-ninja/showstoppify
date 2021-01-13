<template>
  <div id="app">
    <v-app id="inspire">
    <Header/>
      <div class="search">
        <v-form>
          <v-text-field
            class="mt-5"
            label="Search for a movie and nominate your favourites!"
            outlined
            prepend-inner-icon="mdi-magnify"
          ></v-text-field>
        </v-form>
      </div>
      <Movie/>
    </v-app>
  </div>

</template>

<script>
import Header from 'components/Header'
import axios from 'utils/apiClient';
import Movie from 'components/Movie';
import omdb from 'utils/movieApi';

export default {
  components: {
    Movie,
    Header,
  },
  data: function () {
    return {
      message: "SHoopie!",
      name: '',
    }
  },
  mounted: () => {
    console.log(process.env.OMDB_API_KEY);
    omdb.get('/', { params: {i: 'tt3896198', apikey: process.env.OMDB_API_KEY }}).then((res) => {
      console.log(res.data);
    })
    
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

.search {
  padding: 5vh;
}
</style>
