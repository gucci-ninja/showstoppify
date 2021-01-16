<template>
<v-container fluid>
  <v-card
    class="mx-auto"
    max-width="344"
    outlined
  >
    <v-list-item two-line>
      <v-list-item-content>
        <div class="overline mb-4">
          {{ movie.title }}
        </div>
        <v-list-item-title class="headline mb-1">
          {{ movie.year }}
        </v-list-item-title>
      </v-list-item-content>

      <v-list-item-avatar
        tile
        size="100"
        color="grey"
      ><v-img tile :src="movie.poster_url"></v-img></v-list-item-avatar>
    </v-list-item>

    <v-card-actions>
      <v-btn
        outlined
        rounded
        text
        @click="remove"
      >
        Remove
      </v-btn>
    </v-card-actions>
  </v-card>
</v-container>
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