require 'rails_helper'
require 'factory_bot'

describe 'users Api',type: :request do
    it 'return all users' do
        FactoryBot.create(:user, first_name:'qar',last_name:'is',email:'qah',phone:'1243')
        FactoryBot.create(:user, first_name:'qa',last_name:'qa',email:'qa',phone:'123')
        FactoryBot.create(:user, first_name:'qa',last_name:'qa',email:'qa',phone:'123')
        get 'http://127.0.0.1:3000/users'
        expect(response).to have_http_status(:success)

       
       expect(JSON.parse(response.body).size).to eq(80)
    end
    describe 'POST/users',type: :request do
  
        it 'create user' do
            expect{
                post 'http://127.0.0.1:3000/users' ,params: {user: {first_name:'tt',last_name:'is',email:'tah',phone:'12434'}}
            }.to change {User.count}.from(77).to(78)
           
           
            expect(response).to have_http_status(:success)
            end
        end

        # describe 'Del/users',type: :request do
        #     it 'deletes user' do
        #          user = FactoryBot.create(:user, first_name:'qar',last_name:'is',email:'qah',phone:'1243')
        #         delete 'http://127.0.0.1:3000/users/2' 
        #         # delete 'http://127.0.0.1:3000/users/# {user.id}' 
        #         expect(response).to have_http_status(:ok) 
        #         expect(JSON.parse(response.body).size).to eq(2)
        #     end
        # end 
        
        
        describe 'Del/users',type: :request do
           
                 let!(:user) { FactoryBot.create(:user, first_name:'qar',last_name:'is',email:'qah',phone:'1243')}
                 it 'deletes user' do
                    expect{
                        delete "http://127.0.0.1:3000/users/#{user.id}"
                    }.to change {User.count}.from(78).to(77)
                
               
                expect(response).to have_http_status(:ok) 
         
            end
        end  
    
    end

   