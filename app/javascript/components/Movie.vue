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
      >
        Nominate
      </v-btn>
      <v-btn
        color="deep-purple lighten-2"
        text
        @click="reserve"
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
    nomination_list: String
  },
  methods: {
    nominate() {
      axios.patch('/nomination_lists', { 
        params: {
          id: nomination_list,
          movie: movie
        }
      }).then((res) => {
        console.log(res)
      })
      // axios.get('/nomination_lists', { params: { token: '1234' }})
      //   .then(function(res) {
      //   console.log(res);
      // });
    }
  }

}
</script>

<style>

</style>