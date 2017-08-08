require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
    @category = Category.create(name: "cat")
    # @category.name = "cat"
    
    @product = Product.create(
      name: "Russian Blue",
      price: 1800,
      quantity: 4,
      category: @category
    )
  end
  scenario "They see details of the product" do
    visit '/'
    first('article.product').find_link('Details').click
    expect(page).to have_css 'section.products-show'
    save_screenshot
  end
end
