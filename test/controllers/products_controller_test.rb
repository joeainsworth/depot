require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:ruby)
    @product_update = {
      title: 'Lorem Ipsum',
      description: 'How boring is lorem ipsum text?',
      image_url: 'lorem.jpg',
      price: 19.95
    }
    @invalid_product = {
      title: '',
      description: '',
      image_url: '',
      price: 0
    }
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: @product_update}
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: @product_update }
    assert_redirected_to product_url(@product)
  end

  test "should not create invalid product" do
    assert_difference('Product.count') do
      post products_url, params: { product: @product_update }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "can't delete a product in a cart" do
    assert_difference('Product.count', 0) do
      delete product_url(products(:two))
    end

    assert_redirected_to products_url
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
