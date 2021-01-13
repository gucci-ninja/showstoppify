<template>

  <v-list-item>
    <v-list-item-avatar>
      <v-img
        :src="movie.Poster"
      ></v-img>
    </v-list-item-avatar>

    <v-list-item-content>
      <v-list-item-title v-text="movie.Title"></v-list-item-title>
    </v-list-item-content>

    <v-list-item-icon>
      <v-icon color="deep-purple accent-4">
        mdi-cancel
      </v-icon>
    </v-list-item-icon>
  </v-list-item>
</template>

<script>
export default {
  name: 'Nomination',
  props: {
    movie: {
      type: Object,
      default: () => {}
    }
  }

}
</script>

<style>

</style>