require 'rails_helper'

RSpec.describe Api::V1::OverviewController, type: :controller do
  describe '#index' do
    it 'renders overview' do
      get :index, xhr: true, format: :js
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to include('total_amount_of_sales')
      expect(JSON.parse(response.body)).to include('sales_for_each_item')
      expect(JSON.parse(response.body)).to include('total_number_of_each_sold_item')
    end
  end
end
