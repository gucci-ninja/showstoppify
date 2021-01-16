<template>
  <div>
    <v-btn
      class="share"
      color="success"
      fab
      dark
      small
      absolute
      top
      right
      v-clipboard="link"
      @click="snackbar = true"
      >
      <v-icon>mdi-share-variant</v-icon>
    </v-btn>
    <v-snackbar
      v-model="snackbar"
      :timeout="'2000'"
    >
      Copied link!
    </v-snackbar>
  </div>
</template>

<script>
export default {
  props: {
    token: String,
  },
  data: function () {
    return {
      snackbar: false,
    }
  },
  methods: {
    link(){
      return `${window.location.host}/?list=${this.token}`;
    },
    triggerAlert() {
      this.$refs.alert.appear("yes");
    }
  }
}
</script>

<style>

.share {
  top: 10px !important;
}
</style>