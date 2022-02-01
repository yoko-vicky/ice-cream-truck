Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :categories
      resources :products
      resources :sales
      resources :overview, only: [:index]
    end
  end
end
