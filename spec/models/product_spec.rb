require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @product = Product.create
      @product.name = "Russian Blue"
      @product.price = 1800
      @product.quantity = 4
      @category = Category.create
      @category.name = "cat"
      @product.category = @category
      @badproduct = Product.create
    end

    it "product should be valid" do
      expect(@product).to be_valid
    end

    it "product name should be valid" do
      expect(@product).to be_valid
      expect(@badproduct.errors.messages[:name]).to include("can't be blank")
    end

    it "product price validation" do
      expect(@product).to be_valid
      expect(@badproduct.errors.messages[:price]).to include("can't be blank")
    end

    it "product quantity must be present" do
      expect(@product).to be_valid
      expect(@badproduct.errors.messages[:quantity]).to include("can't be blank")
    end

    it "product category must be present" do
      expect(@category).to be_valid
      expect(@badproduct.errors.messages[:category]).to include("can't be blank")
    end 

  end
end
