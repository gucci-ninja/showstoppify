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
        @click="reserve"
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
export default {
  name: 'Movie',
  props: {
    movie: {
      type: Object,
      default: () => {},
    }
  }

}
</script>

<style>

</style>