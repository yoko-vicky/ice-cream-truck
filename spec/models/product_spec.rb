require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:category) { create(:category) }
  let(:product) { create(:product, category_id: category.id, price: 100) }
  let(:product2) { create(:product, category_id: category.id, price: 50) }
  let(:product3) { create(:product, category_id: category.id, price: 80) }
  let(:sale) { create(:sale, product_id: product.id) }
  let(:sale2) { create(:sale, product_id: product.id) }
  let(:sale3) { create(:sale, product_id: product3.id) }

  describe 'association' do
    it { should belong_to(:category) }
    it { should have_many(:sales) }
  end

  describe 'validates' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:stock) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_length_of(:name).is_at_least(3).is_at_most(15) }
  end

  describe 'scope, methods' do
    it 'returns product collection sorted by desc' do
      category
      product
      product2
      product3
      expect(Product.sort_by_latest.first).to eq product3
    end

    it 'returns total sales of product' do
      category
      product
      product2
      product3
      sale
      sale2
      sale3
      expect(product.total_sales).to eq 200
      expect(product2.total_sales).to eq 0
      expect(product3.total_sales).to eq 80
    end
  end
end
