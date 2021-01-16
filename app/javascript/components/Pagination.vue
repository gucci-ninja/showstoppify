<template>
  <div class="text-center">
    <v-pagination
      @input="nextPage"
      :value="page"
      :length="numPages"
      :total-visible="7"
    ></v-pagination>
  </div>
</template>

<script>
export default {
  props: {
    numPages: Number,
    page: Number
  },
  methods: {
    nextPage(page) {
      this.$emit('page', page)
    },
  }
}
</script>

<style>

</style>