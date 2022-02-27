require 'rails_helper'

RSpec.describe Api::V1::ProductsController, type: :controller do
  let(:category) { create(:category) }
  let(:product) { create(:product, category: category) }
  let(:product2) { create(:product, category: category) }
  let(:product3) { create(:product, category: category) }

  describe '#index' do
    it 'renders all products' do
      product
      product2
      product3
      get :index, xhr: true, format: :js
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).count).to eq 3
    end
  end

  describe '#show' do
    it 'renders product with product id' do
      product
      get :show, params: { id: product.id }, xhr: true, format: :js
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['name']).to eq product.name
    end
  end

  describe '#create' do
    it 'create new product based on params' do
      category
      params = {
        product: {
          name: 'New Product',
          price: 99,
          stock: 100,
          category_id: category.id
        }
      }
      post :create, params: params, xhr: true, format: :js
      expect(response).to have_http_status(201)
      expect(JSON.parse(response.body)['product']['name']).to eq 'New Product'
    end

    it 'returns error message if correct params not provided' do
      params = {
        product: {
          name: '',
          price: 0,
          stock: 0,
          category_id: category.id
        }
      }
      post :create, params: params, xhr: true, format: :js
      expect(response).to have_http_status(400)
      expect(JSON.parse(response.body)['message']).to eq 'Something is wrong'
    end
  end

  describe '#update' do
    it 'update category based on params' do
      category
      product
      params = {
        id: product.id,
        product: {
          price: 9999
        }
      }
      put :update, params: params, xhr: true, format: :js
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['product']['price']).to eq 9999
    end

    it 'returns error message if correct params not provided' do
      category
      product
      params = {
        id: product.id,
        product: {
          name: ''
        }
      }
      put :update, params: params, xhr: true, format: :js
      expect(response).to have_http_status(404)
      expect(JSON.parse(response.body)['message']).to eq 'Something is wrong'
    end
  end

  describe '#destroy' do
    it 'destroy category based on params' do
      product
      product2
      product3
      delete :destroy, params: { id: product.id }, xhr: true, format: :js
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).count).to eq 2
    end

    it 'returns error message if correct params not provided' do
      expect {
          delete :destroy, params: { id: 'abc' }, xhr: true, format: :js
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
