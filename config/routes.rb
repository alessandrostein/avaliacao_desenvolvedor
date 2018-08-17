Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "sales#index"
  resources :sales, except: [:edit, :destroy] do
    collection do
      post :import
    end
  end
end
