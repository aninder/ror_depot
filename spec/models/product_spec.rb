require 'rails_helper'

RSpec.describe Product, type: :model do

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:image_url) }
  it { should validate_uniqueness_of(:title) }
  it do
    should validate_numericality_of(:price)
               .is_greater_than_or_equal_to 0.01
  end
# it { is_expected.to validate_length_of(:password).is_at_least(10) }

  let(:valid_attributes) {
    {
        title: 'Lorem Ipsum',
        description: 'Wibbles are fun!',
        image_url: 'lorem.jpg',
        price: 19.95
    }
  }

  describe "when initialised without any attributes" do
    it "should be invalid" do
      product = Product.new
      expect(product).not_to be_valid
      expect(product.errors[:title].any?).to(be(true))
      expect(product.errors[:description].any?).to(be(true))
      expect(product.errors[:price].any?).to(be(true))
      expect(product.errors[:image_url].any?).to(be(true))
    end
  end

  describe "when initialized with valid attributes" do
    it "should be valid" do
      product = Product.new(valid_attributes)
      expect(product).to be_valid
    end
  end
end
