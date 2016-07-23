module CartsHelper
  def display_cart_buttons
    unless current_page?(new_order_path)
      "Not on cart"
    end
  end
end
