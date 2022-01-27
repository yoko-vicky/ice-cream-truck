require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "association" do
     it { should have_many(:products).dependent(:destroy) }
     it { should have_many(:sales).through(:products) }
  end

  describe "validates" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:max) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_length_of(:name).is_at_least(3).is_at_most(15) }
  end
end
