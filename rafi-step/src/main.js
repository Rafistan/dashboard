import Vue from 'vue';
import App from './App.vue';

window.setImmediate = window.setTimeout;
Vue.config.productionTip = false;

new Vue({
  render: h => h(App),
}).$mount('#app');
