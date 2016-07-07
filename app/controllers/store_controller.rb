class StoreController < ApplicationController
  include CatalogCounter

  def index
    catalog_counter
    @products = Product.order(:title)
  end
end
