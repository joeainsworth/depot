module StoreHelper
  def number_to_currency(number)
    sprintf("$%0.02f", number)
  end
end
