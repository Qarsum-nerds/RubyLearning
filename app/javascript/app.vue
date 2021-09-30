
<template>
  <div>
    <h1>hoi i am App.vue</h1>
      <p>{{ message }}</p>
  </div>
</template>

 <script>



// import sample from "./packs/components/sample.vue";
export default {
  data: function() {
    return {
      message: "Helloo Vue!"
    };
  },
  // components: {
  //   sample: sample
  // }
 
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>