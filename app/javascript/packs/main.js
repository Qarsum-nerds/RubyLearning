/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.




// import Vuetify from 'vuetify'
// import 'vuetify/dist/vuetify.min.css'
// Vue.use(Vuetify)

// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({


//     vuetify: new Vuetify(),
    
//     render: h => h(App)
//   }).$mount()
//   document.body.appendChild(app.$el)

//   console.log(app)
// })


// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:


import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'
import Test from '../test.vue'

import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'
Vue.use(Vuetify);
const vuetify = new Vuetify();

Vue.component('MyTestComponent', App);
Vue.component('Test', Test);

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app',
    vuetify
  })
})

//
//
// If the project is using turbolinks, install 'vue-turbolinks':
//
// yarn add vue-turbolinks
//
// Then uncomment the code block below:
//
// import TurbolinksAdapter from 'vue-turbolinks'
// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// Vue.use(TurbolinksAdapter)
//
// document.addEventListener('turbolinks:load', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: () => {
//       return {
//         message: "Can you say hello?"
//       }
//     },
//     components: { App }
//   })
// })
