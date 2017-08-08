require 'rails_helper'

RSpec.feature "AddCart", type: :feature, js: true do
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
  scenario "Cart will turn from 0 to 1" do
    visit '/'
    first('article.product').find_link('Add').click
    expect(page).to have_link 'My Cart (1)', href: '/cart'
    save_screenshot
  end
end

