require 'rails_helper'

RSpec.describe Sale, type: :model do
  describe 'association' do
    it { should belong_to(:product).dependent(:destroy) }
  end

  describe 'validates' do
    it { should validate_presence_of(:sold_date) }
  end
end
