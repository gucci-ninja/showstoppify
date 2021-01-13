<template>
  <v-navigation-drawer
    absolute
    permanent
    right
    width="400"
  >
    <v-list-item two-line>
      <h1>Your Nominations 🏆</h1>
    </v-list-item>

    <v-divider></v-divider>
    
    <v-list v-if="nominations.length" dense>
      <Nomination v-for="movie in nominations" :key="movie" :movie="movie" />
    </v-list>
    <v-list v-else dense>
      <v-list-item>Looks like you haven't nominated any movies 😢</v-list-item>
    </v-list>
  </v-navigation-drawer>
</template>

<script>
import Nomination from './Nomination'

export default {
  name: 'Nominations',
  components: {
    Nomination
  },
  props: {
    nominations: {}
  }
}
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap');

html {
  font-family: Roboto
}
</style>