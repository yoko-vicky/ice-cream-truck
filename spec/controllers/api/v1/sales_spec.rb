require 'rails_helper'

RSpec.describe Api::V1::SalesController, type: :controller do
  let(:category) { create(:category) }
  let(:product) { create(:product, category_id: category.id) }
  let(:sale) { create(:sale, product_id: product.id) }
  let(:sale2) { create(:sale, product_id: product.id) }
  let(:sale3) { create(:sale, product_id: product.id) }

  describe '#index' do
    it 'renders all sales belonging to product' do
      sale
      sale2
      sale3
      params = {
        product_id: product.id,
        category_id: category.id
      }
      get :index, params: params, xhr: true, format: :js
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).count).to eq 3
    end
  end

  describe '#show' do
    it 'renders sale with sale id' do
      sale
      params = {
        id: sale.id,
        product_id: product.id,
        category_id: category.id
      }
      get :show, params: params, xhr: true, format: :js
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['id']).to eq sale.id
      expect(JSON.parse(response.body)['product_id']).to eq product.id
    end
  end

  describe '#create' do
    it 'create new sale based on params' do
      product
      category

      sold_date = '-4712-01-01T00:00:00.000Z'
      product_stock = product.stock

      params = {
        product_id: product.id,
        category_id: category.id,
        sale: {
          product_id: product.id,
          sold_date: sold_date
        }
      }
      post :create, params: params, xhr: true, format: :js
      product.reload

      expect(response).to have_http_status(201)
      expect(JSON.parse(response.body)['sale']['sold_date']).to eq sold_date
      expect(product.stock).to eq product_stock - 1
      expect(JSON.parse(response.body)['message']).to eq 'ENJOY!'
    end

    it 'returns error message if correct params not provided' do
      params = {
        product_id: product.id,
        category_id: category.id,
        sale: {
          product_id: product.id,
          sold_date: ''
        }
      }
      post :create, params: params, xhr: true, format: :js
      expect(response).to have_http_status(404)
      expect(JSON.parse(response.body)['message']).to eq 'Something is wrong'
    end

    it 'returns no more stock message if product have no stock ' do
      product
      category

      sold_date = '-4712-01-01T00:00:00.000Z'
      product.update_attribute(:stock, 0)

      params = {
        product_id: product.id,
        category_id: category.id,
        sale: {
          product_id: product.id,
          sold_date: sold_date
        }
      }
      post :create, params: params, xhr: true, format: :js

      expect(response).to have_http_status(404)
      expect(JSON.parse(response.body)['message']).to eq 'SO SORRY! We have no stock.'
    end
  end
end
