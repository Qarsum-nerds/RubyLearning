
<template>

  <div id="app">
    <v-app>
      <p>{{ message }}</p>
      <sample/>
    </v-app>
  </div>
</template>

 <script>



import sample from "./packs/components/sample.vue";
export default {
  data: function() {
    return {
      message: "Helloo Vue!"
    };
  },
  components: {
    sample: sample
  }
 
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>