<template>
  <div class="text-center">
    <v-pagination
      @next="$emit('next')"
      @previous="$emit('prev')"
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
}
</script>

<style>

</style>