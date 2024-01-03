Rails.application.routes.default_url_options[:host] = 'localhost:3000'

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :events do
    member do
      post :join
      delete :leave
    end
  end
end
