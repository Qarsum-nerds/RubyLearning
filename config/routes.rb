Rails.application.routes.draw do
     
        root to:'welcome#index'
      
        get 'app', to: 'users#index'
       resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end



