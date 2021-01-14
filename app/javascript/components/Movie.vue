<template>
  <v-card
    class="mx-auto flex d-flex flex-column"
    max-width="300"
  >
    <v-img
      height="250"
      :src="movie.Poster"
    ></v-img>

    <v-card-title>{{ movie.Title }}</v-card-title>

    <v-card-text>
      <v-row
        align="center"
        class="mx-0"
      >
        <div class="subtitle-1">
          {{ movie.Year }}
        </div>
      </v-row>
    </v-card-text>

    <v-divider class="mx-4"></v-divider>

    <v-card-actions>
      <v-btn
        color="deep-purple lighten-2"
        text
        @click="nominate"
        :disabled="movie.nominated"
      >
        Nominate
      </v-btn>
      <v-btn
        color="deep-purple lighten-2"
        text
        @click="remove()"
        :disabled="!movie.nominated"
      >
        Cancel Nomination
      </v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
import axios from '../utils/apiClient';

export default {
  name: 'Movie',
  props: {
    movie: {
      type: Object,
      default: () => {},
    },
    nomination_list: {},
  },
  // data: function () {
  //   return {
  //     isNominated: this.movie.nominated,
  //   }
  // },
  methods: {
    nominate() {
      axios.post('/movies', { 
        movie: {
          nomination_list_id: this.nomination_list.id,
          title: this.movie.Title,
          year: this.movie.Year,
          poster_url: this.movie.Poster,
        }
      }).then((res) => {
        this.$emit('nominate');
      })
      // axios.get('/nomination_lists', { params: { token: '1234' }})
      //   .then(function(res) {
      //   console.log(res);
      // });
    },
    remove() {
      axios.get('/movies', {
        params: {
          nomination_list_id: this.nomination_list.id,
          title: this.movie.Title
        }
      }).then((res) => {
        axios.delete(`/movies/${res.data.id}`)
          .then((res) => {
            this.$emit('remove')
          });
      });
    }
  },

}
</script>

<style>

</style>