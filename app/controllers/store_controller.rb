class StoreController < ApplicationController
  include CatalogCounter
  include CurrentCart
  before_action :set_cart

  def index
    @products = Product.order(:title)
  end
end
