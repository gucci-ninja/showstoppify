<template>

  <v-list-item>
    <!-- <v-list-item-avatar>
      <v-img
        :src="movie.poster_url"
      ></v-img>
    </v-list-item-avatar> -->

    <v-list-item-content>
      <v-list-item-title v-text="movie.title"></v-list-item-title>
    </v-list-item-content>

    <v-list-item-icon>
      <v-icon 
        color="deep-purple accent-4"
        @click="remove"
      >
        mdi-close
      </v-icon>
    </v-list-item-icon>
  </v-list-item>
</template>

<script>
import axios from '../utils/apiClient';

export default {
  name: 'Nomination',
  props: {
    movie: {
      type: Object,
      default: () => {}
    }
  },
  methods: {
    remove() {
      axios.delete(`/movies/${this.movie.id}`)
      .then((res) => {
        this.$emit('remove');
      })
    }
  }

}
</script>

<style>

</style>