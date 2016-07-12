module LineItemsHelper
  def populate_select(quantity)
    return 1..quantity if quantity > 50
    1..50
  end
end
