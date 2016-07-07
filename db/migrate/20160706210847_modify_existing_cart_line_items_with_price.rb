class ModifyExistingCartLineItemsWithPrice < ActiveRecord::Migration[5.0]
  def up
    LineItem.all.each do |item|
      item.update_attribute('price', item.product.price)
    end
  end

  def down
    remove_column :line_items, :price
  end
end
