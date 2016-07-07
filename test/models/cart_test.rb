require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "add two items to the cart and get total cart price" do
    cart = Cart.new
    cart.add_product(products(:one))
    cart.add_product(products(:two))
    assert_equal cart.line_items.size, 2
    cart_total = products(:one).price + products(:two).price
    assert_equal cart.total_price, cart_total
  end
end
