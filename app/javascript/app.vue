<template>
  <div id="app">
    <Nominations v-on:remove="updateNominations()" :nominations="nomination_list.movies" />
    <v-app id="inspire">
      <Banner v-if="limitReached" />
      <v-col md="9" sm="6">
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
        <Pagination 
          @page="changePage"
          :numPages="numPages"
          :page="page"
        />
        <v-container fluid>
          <v-row dense>
            <v-col md="2" class="pa-3 d-flex flex-column" v-for="movie in movies" :key="movie.id" :movie="movie" >
              <Movie 
                v-on:nominate="updateNominations()"
                v-on:remove="updateNominations()"
                :movie="movie"
                :nomination_list="nomination_list"
              />
            </v-col>
            <!-- <Movie v-on:nominate="fetchNominations()" :movie="sampleMovie" :nomination_list="nomination_list" /> -->
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
import Banner from 'components/Banner';
import Pagination from 'components/Pagination'

export default {
  components: {
    Movie,
    Header,
    Nominations,
    Banner,
    Pagination,
  },
  data: function () {
    return {
      message: process.env.OMDB_API_KEY,
      movieQuery: '',
      movies: {},
      sampleMovie: { Title: 'Some Title that is really long liek super ong', Poster: 'poster', Year: '2021'},
      nomination_list: {},
      token: '',
      numPages: 0,
      page: 1,
    }
  },
  created() {
    var query = window.location.search.substring(1);
    if (query) {
      var pair = query.split('=')
      if (pair[0] == 'list') {
        this.token = pair[1];
      }
    }
  },
  mounted() {
    if (this.token === '') {
      if (localStorage.token) {
        this.token = localStorage.token;
      } else {
        this.token = require("crypto").randomBytes(32).toString('hex');
        localStorage.token = this.token;
      }
    }
    this.fetchNominations();
  },
  methods: {
    searchMovies() {
      omdb.get('/', { 
        params: {
          s: this.movieQuery,
          type: 'movie',
          apikey: process.env.OMDB_API_KEY,
          page: this.page,
        }
      }).then((res) => {
        this.movies = res.data.Search;
        this.movies.forEach((movie) => {
          movie.nominated = this.nomination_list.movies.some(e => e.title === movie.Title) })
        this.numPages = Math.floor(res.data.totalResults/10)
        });
    },
    fetchNominations() {
      axios.post('/nomination_lists', { nomination_list: { token: this.token }})
      .then((res) => {
        this.nomination_list = res.data;
      });

    },
    updateNominations() {
      this.fetchNominations();
      this.searchMovies();
    },
    changePage(page) {
      this.page = page;
      this.searchMovies();
    }
  },
  computed: {
    limitReached: function() {
      return this.nomination_list.movies.length == 5;
    }
  }
}
</script>

<style scoped>

.search {
  padding: 5vh;
}
</style>
