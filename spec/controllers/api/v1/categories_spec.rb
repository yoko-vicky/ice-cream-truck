require 'rails_helper'

RSpec.describe Api::V1::CategoriesController, type: :controller do
  let(:category) { create(:category) }
  let(:category2) { create(:category) }
  let(:category3) { create(:category) }

  describe '#index' do
    it "renders all the categories" do
      category
      category2
      category3
      get :index, xhr: true, format: :js
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).count).to eq 3
    end
  end

  describe '#show' do
    it "renders category with category id" do
      category
      get :show, params: { id: category.id }, xhr: true, format: :js
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['name']).to eq category.name
    end
  end

  describe '#create' do
    it "create new category based on params" do
      params = {
        category: {
          name: 'New Category',
          max: 99
        }
      }
      post :create, params: params, xhr: true, format: :js
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['category']['name']).to eq 'New Category'
    end

    it "returns error message if correct params not provided" do
      params = {
        category: {
          name: '',
        }
      }
      post :create, params: params, xhr: true, format: :js
      expect(response).to have_http_status(404)
      expect(JSON.parse(response.body)['message']).to eq 'Something is wrong'
    end
  end

  describe '#update' do
    it "update category based on params" do
      category
      params = {
        id: category.id,
        category: {
          max: 9999
        }
      }
      put :update, params: params, xhr: true, format: :js
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['category']['max']).to eq 9999
    end

    it "returns error message if correct params not provided" do
      category
      params = {
        id: category.id,
        category: {
          name: ''
        }
      }
      put :update, params: params, xhr: true, format: :js
      expect(response).to have_http_status(422)
      expect(JSON.parse(response.body)['message']).to eq 'Something is wrong'
    end
  end

  describe '#destroy' do
    it "destroy category based on params" do
      category
      category2
      category3
      delete :destroy, params: { id: category.id }, xhr: true, format: :js
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).count).to eq 2
    end

    it "returns error message if correct params not provided" do
      delete :destroy, params: { id: 0 }, xhr: true, format: :js
      expect(response).to have_http_status(404)
      expect(JSON.parse(response.body)['error']).to eq 'Category could not be deleted'
    end
  end
end
