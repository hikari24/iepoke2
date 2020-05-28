Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
}
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  registrations: 'users/registrations'
}

#会員側
root to: 'home#top'
get "/about" => "home#about"

resource :users, only: [:show, :edit, :update]
 #get "/users/password" => "users#edit"
 get "/users/quit" => "users#quit"
 put "/users/hide" => "users#hide", as: 'users_hide'
 get "/users/thank" => "users#thank", as: 'users_thank'
resources :foods do
	member do
	put "foods/wish_list_create" => "foods#wish_list_create"
 	delete "foods/wish_list_destroy" => "foods#wish_list_destroy"
 end
 end
 get "/wish_lists" => "foods#wish_list"

resources :categories, only: [:new, :create, :index, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#管理者側
namespace :admins do
	root to: "home#top"
	resources :users, only: [:index, :show]
end

end
