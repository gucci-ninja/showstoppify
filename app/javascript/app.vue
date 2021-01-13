<template>
  <div id="app">
    <v-app id="inspire">
      <Nominations :nominations="nominations" />
      <v-col cols=9>
        <Header/>
        <div class="search">
          <v-form
            ref="form"
            @submit.prevent="searchMovies"
          >
            <v-text-field
              v-model="movieQuery"
              class="mt-5"
              label="Search for a movie and nominate your favourites! 🎥"
              outlined
              prepend-inner-icon="mdi-magnify"

            ></v-text-field>
          </v-form>
        </div>
        <v-container fluid>
          <v-row dense>
            <v-col md="3" class="pa-3 d-flex flex-column" v-for="movie in movies" :key="movie" :movie="movie" >
              <Movie :movie="movie"/>
            </v-col>
            <!-- <Movie :movie="sampleMovie"/> -->
          </v-row>
        </v-container>
      </v-col>
    </v-app>
  </div>

</template>

<script>
import Header from 'components/Header'
import axios from 'utils/apiClient';
import Movie from 'components/Movie';
import omdb from 'utils/movieApi';
import Nominations from 'components/Nominations'

export default {
  components: {
    Movie,
    Header,
    Nominations
  },
  data: function () {
    return {
      message: "SHoopie!",
      name: '',
      movieQuery: '',
      movies: {},
      sampleMovie: { Title: 'Some Title that is really long liek super ong', Poster: 'poster', Year: '2021'},
      nominations: {}
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
    getName() {

      axios.get('/landing/test')
        .then((xhr) => {
          this.name = xhr.data.name;

        });
        return this.name;
    },
    searchMovies() {
      omdb.get('/', { 
        params: {
          s: this.movieQuery,
          type: 'movie',
          apikey: process.env.OMDB_API_KEY
        }
      }).then((res) => {
        this.movies = res.data.Search;
    })
    }
  },
}
</script>

<style scoped>

.search {
  padding: 5vh;
}
</style>
