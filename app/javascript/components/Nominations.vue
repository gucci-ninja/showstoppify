<template>
  <v-navigation-drawer
    class="nominations"
    absolute
    permanent
    right
    width="400"
  >
    <v-list-item two-line>
      <h1>Your Nominations 🏆</h1>
    </v-list-item>

    <v-divider></v-divider>
    
    <v-list v-if="nominations && nominations.length" dense>
      <Nomination v-on:remove="$emit('remove')" v-for="movie in nominations" :key="movie.id" :movie="movie" />
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
  },
}
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap');

* {
  font-family: Roboto
}

.nominations {
  height: 100vh !important;
}
</style>