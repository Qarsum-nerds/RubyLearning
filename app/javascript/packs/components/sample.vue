<template>

  <v-data-table light :headers="headers"  :search="search" :items="users"   class="elevation-1">

<!-- :search="search" -->



    <template v-slot:top>
      <v-toolbar flat color="light-blue">
        <v-toolbar-title >Users Lists</v-toolbar-title>
         <v-spacer></v-spacer>
         
         <v-card-title>
               <v-text-field
                  v-model="search"
                  append-icon="mdi-magnify"
                  label="Search here"
                  single-line
                   
                  hide-details
                ></v-text-field> 
            </v-card-title>
 
      
        
        
        <v-divider class="mx-4" inset vertical></v-divider>
        <v-spacer></v-spacer>
        <v-dialog v-model="dialog" max-width="500px">

          <template v-slot:activator="{ on }">
            <v-btn color="black" dark class="mb-2" v-on="on">New user</v-btn>
          </template>
          <v-card>
           <span class="headline">{{ formTitle }}</span>
             
        <v-card-text>
              <v-container>
                <v-row>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field v-model="editedItem.first_name" label="First Name"></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field v-model="editedItem.last_name" label="Last Name"></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field v-model="editedItem.email" label="Email"></v-text-field>
                  </v-col>
                  <v-col cols="12" sm="6" md="4">
                    <v-text-field v-model="editedItem.phone" label="Phone"></v-text-field>
                  </v-col>
                 
                </v-row>
              </v-container>
            </v-card-text>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" text @click="close">Cancel</v-btn>
              <v-btn color="blue darken-1" text @click="save(editedItem)">Save</v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-toolbar>
    </template>
    
    
    <template v-slot:[`item.actions`]="{ item }">
      <!-- <v-icon small color="blue darken-1" class="mr-2" @click="editItem(item)">Edit</v-icon>
      <v-icon small color="blue darken-1" @click="deleteItem(item)">Delete</v-icon>
      -->
     <v-btn small color="blue darken-1" class="mr-2" @click="editItem(item)">edit</v-btn>
     <v-btn small color="blue darken-1" class="mr-2" @click="deleteItem(item)">del</v-btn>
    </template>


   
    <!-- <template v-slot:no-data>
      <v-btn color="primary" @click="initialize">Reset</v-btn>
    </template> -->



    
  </v-data-table>
</template>

<script>
import axios from "axios";
export default {
  data: () => ({
        search:'',
    dialog: false,
    headers: [
      {
        text: "First Name",
        align: "left",
        sortable: false,
        value: "first_name"
      },
      { text: "Last Name", value: "last_name" },
      { text: "Email", value: "email" },
      { text: "Phone", value: "phone" },
      
      { text: "Actions", value: "action", sortable: false }
    ],
    users: [],
    editedIndex: -1,
    editedItem: {
      first_name: "",
      last_name: "",
      email: "",
      phone: "",
      
    },
    defaultItem: {
       first_name: "",
      last_name: "",
      email: "",
      phone: ""
    }
  }),
  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "New User" : "Edit User";
    }
  },
  watch: {
    dialog(val) {
      val || this.close();
    }
  },
  created() {
    this.initialize();
    this.filterUsers();
  },
  methods: {
    filterUsers(){
      return axios
       .get("https://localhost:3000/users")
        .then(response => {

          if (this.search) {
            this.users = response.results.filter(users =>
              users.name.toLowerCase().includes(this.search.toLowerCase())
            );
          } else {
            this.users = res.results;
          }
        })
        .catch(e => {
          console.log(e);
        });
    },

    initialize() {
      return axios
        .get("http://localhost:3000/users")
        .then(response => {
          console.log(response.data);
          this.users = response.data;
        })
        .catch(e => {
          console.log(e);
        });
    },
    getUser(item) {
    
          return axios
        .get(`https://localhost:3000/${item.id}`)
        .then(response => {
          console.log(response)
         this.users = response.data;
    })
   .catch(error => {
    console.log(error);
    })
},
editItem(item) {
  this.editedIndex = item.id;
  this.editedItem = Object.assign({}, item);
  this.dialog = true;
},
save(item) {
  if (this.editedIndex > -1) {
    axios
      .put(`http://localhost:3000/users/${item.id}`, {
        id: this.editedItem.id,
        first_name: this.editedItem.first_name,
        last_name: this.editedItem.last_name,
        email: this.editedItem.email,
        phone: this.editedItem.phone
       
      })
      .then(response => {
       console.log(response);
       this.initialize();
      })
      .catch(error => {
       console.log(error);
    });
  } else {
    axios
   .post(`http://localhost:3000/users/`, {
     user: this.editedItem
   })
   .then(response => {
     alert("user created");
     alert(response.data.json);
    this.initialize();
   })
   .catch(error => {
     console.log(error);
 });
  }
  this.close();
},
  deleteItem(item) {
  const index = this.users.indexOf(item);
  if (confirm("Are you sure you want to delete this item?")){
 axios
    .delete(`http://localhost:3000/users/${item.id}`)
    .then(response => {
     alert(response.data.json);
      this.initialize();
    })
    .catch(error => {
      console.log(error);
    });
    this.users.splice(index, 1);
  }; 
 
},
  
  close() {
      this.dialog = false;
      setTimeout(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      }, 300);
    }
  }
};
</script>


















