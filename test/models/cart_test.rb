require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'add products' do
    cart = Cart.new
    first_item = cart.add_product products :ruby
    assert first_item
    assert first_item.total_price
    second_item = cart.add_product products :ruby
    assert_equal(cart.line_items.size, 2)
    expected_price = first_item.total_price + second_item.total_price
    assert_equal(cart.total_price, expected_price)
  end
end
