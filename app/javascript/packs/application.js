// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
// import * as ActiveStorage from "@rails/activestorage"
// import "channels"

// Rails.start()
// Turbolinks.start()
// ActiveStorage.start()

import Vue from 'vue'
import vuetify from '../utils/vuetify.js'
import App from '../app.vue'
import Clipboard from 'v-clipboard'

Vue.use(Clipboard)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(App),
    vuetify: vuetify
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})
