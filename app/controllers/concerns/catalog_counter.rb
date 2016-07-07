module CatalogCounter

  private

    def catalog_counter
      set_catalog_counter_to_zero if session[:counter].nil?
      session[:counter] += 1
    end

    def set_catalog_counter_to_zero
      session[:counter] = 0
    end
end
