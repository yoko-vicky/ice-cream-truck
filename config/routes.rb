Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :categories do
        resources :products do
          resources :sales
        end
      end
    end
  end
end
