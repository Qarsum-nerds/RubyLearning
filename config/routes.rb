Rails.application.routes.draw do
      # get 'welcome/index'
        root to:'welcome#index'
      
       get 'app', to: 'users#index'
       resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end



# https://levelup.gitconnected.com/vue-js-with-rails-6-and-performing-crud-operations-b043ef3691f2