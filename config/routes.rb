Rails.application.routes.draw do

  resources :books

  resources :books do
    resources :reviews
  end

end
