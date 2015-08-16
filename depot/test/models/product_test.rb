require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product prive must be positive" do
    product = Product.new(title: "Book Title", description: "asdf", image_url: "abc.jpg")
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  def new_product_with_url(image_url)
    Product.new(title: "My Title", description: "asdfasdf", price: 1, image_url: image_url)
  end
  test "image_url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    ok.each do |name|
        assert new_product_with_url(name).valid?, "#{name} should be valid"
    end
    bad.each do |name|
        assert new_product_with_url(name).invalid?, "#{name} shouldn't be valid"
    end
  end

  test "product is not valid without unique title" do
    product = Product.new(title: products(:ruby).title, description: "asdf", price: 1, image_url: "a.png")
    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end


end
