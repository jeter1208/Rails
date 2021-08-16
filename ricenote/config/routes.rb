Rails.application.routes.draw do
  # get "/notes", to:"notes#index"
  # get "/notes/new", to:"notes#new"
  # get "/notes/:id", to:"notes#id"
  get "/", to:"notes#index"
  resources :notes
  # , path:articles可以直接這樣改
#  delete :cancel, on: :member這樣也行
#  resources :orders,only:[:index,:show] do
#    meber do
#      DELETE :cancel
#     #  DELETE /orders/2/cancel 刪除2號訂單
#    end
   
#    collection do
#      delete :cancel
#     #  DELETE /orders/cancel 
#    end
#  end
#  except:[:index]
                #  挑一組用先用only就好
                #  只開這些不要給別人機會

resources :users, only: [:create] do
  collection do
    get :sign_up   # GET /users/sign_up 註冊表單
    get :sign_in   # GET /users/sign_in 登入表單
  end
 end
              
post "/users/sign_in", to: "sessions#create", as: "login"
delete "/users", to: "sessions#destroy", as: "logout"


get "/hello", to: "pages#main"
get "/about", to: "pages#about"

  # get "/users", to: "users#profile"
end
