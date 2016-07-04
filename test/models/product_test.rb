require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  def setup
    @ruby = products(:ruby)
  end

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:image_url].any?
    assert product.errors[:price].any?
  end

  test "product price must be positive" do
    product = Product.new(title: "New Book Title",
                          description: @ruby.description,
                          image_url: @ruby.image_url )
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
                  product.errors[:price]
    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
                   product.errors[:price]
    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)
    Product.new(title: "Book Title",
                description: "Really cool description",
                price: 1,
                image_url: image_url)
  end

  test "image url" do
    valid_image   = %w(fred.gif fred.jpg fred.png FRED.jpg FRED.Jpg
                       http://image-host.com/fred.jpg)
    invalid_image = %w(fred.doc fred.gif/more fred.gif.more)

    valid_image.each do |image|
      assert new_product(image).valid? "#{image} shouldn't be invalid"
    end

    invalid_image.each do |image|
      assert new_product(image).invalid? "#{image} shouldn't be valid"
    end
  end

  test "product is not valid without a unique title" do
    product = Product.new(title: @ruby.title,
                          description: "Blah blah blah",
                          price: 1,
                          image_url: "fred.jpg")
    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end
end
