require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should not create a product if the name is missing' do
      @category = Category.new(name: "Testing")
      @product = Product.new(price_cents: 1000, quantity: 100, :category => @category)
      @product.valid?
      expect(@product.errors[:name]).to include("can\'t be blank")
    end

      # it "is not valid without a name"
    it "is not valid without a price" do
      @category = Category.new(name: "Testing")
      @product = Product.new(name: "Balls", quantity: 100, :category => @category)
      @product.valid?
      expect(@product.errors[:price_cents]).to include("is not a number")
    end
    it "is not valid without a quantity" do
      @category = Category.new
      @product = Product.new(price_cents: 1000, name: "Balls", :category => @category)
      @product.valid?
      expect(@product.errors[:quantity]).to include("can't be blank")
    end
    it "is not valid without a category" do
      @product = Product.new(price_cents: 1000, name: "Balls")
      @product.valid?
      expect(@product.errors[:category]).to include("can't be blank")
    end
  end
end


# context "given '2,4'" do
#   it "returns 6" do
#     expect(StringCalculator.add("2,4")).to eql(6)
#   end