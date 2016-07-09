class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def has_items?
    line_items.count > 0
  end

  def add_product(product, quantity = 1)
    current_item = line_items.find_by(product_id: product.id)
    if current_item
      current_item.quantity += quantity
    else
      current_item = line_items.build(product_id: product.id, quantity: quantity)
      current_item.price = current_item.product.price
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
