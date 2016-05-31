Rails.application.routes.draw do
  root 'reviews#index'
  devise_scope :user do
    get "/users/bias" => "registrations#bias"
  end
  get 'reviews/bias' => 'registrations#bias'
  get 'contributor_info' => 'reviews#info'
  get 'mobile' => 'cities#mobile_test'
  resources :cities, only: [:index, :update, :create]
  resources :reviews
  devise_for :users, controllers: { registrations: "registrations" }
  resources :users, only: [:index, :show, :edit, :update]

  post 'cities/popup' => 'cities#popup'
end
