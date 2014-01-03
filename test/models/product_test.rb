require 'test_helper'

class ProductTest < ActiveSupport::TestCase

fixtures :products
  
  test "product with filled attributes" do
    assert products(:valid_book).valid?
  end

  test "product attributes must not be empty" do
    assert products(:invalid_book).invalid?
    assert products(:invalid_book).errors[:title].any?
    assert products(:invalid_book).errors[:description].any?
    assert products(:invalid_book).errors[:price].any?
    assert products(:invalid_book).errors[:image_url].any?
  end

  test "product price cannot be negative number" do
    products(:valid_book).price = -1
    assert products(:valid_book).invalid?
    assert_equal 'Price have to be not less that 0.01' , products(:valid_book).errors[:price].join('; ')
  end

  test "product price cannot be less than 0.01" do
    products(:valid_book).price = 0.001
    assert products(:valid_book).invalid?
    assert_equal 'Price have to be not less that 0.01' , products(:valid_book).errors[:price].join('; ')
  end

  test "jpg, png and gif image formats are acceptable" do
    ok = %w{ ann.jpg valid_img.png valig.gif smthg.JPG http://a.b.c/lalal.png }
    ok.each do |image| 
      products(:valid_book).image_url = image
      assert products(:valid_book).valid?, "#{image} shouldnt be invalid"
    end
  end

  test "any formats except:{jpg, png and gif} image formats are invalid" do
    bad = %w{ ann.doc invalid_img valig.txt smthg.p_n_g http://a.b.c/lalal_png }
    bad.each do |image| 
      products(:valid_book).image_url = image
      assert products(:valid_book).invalid?, "#{image} shouldnt be valid"
    end
  end

  test "title of book have to be unique" do
    product = Product.new(title: products(:valid_book).title,
    	description: 'a',
    	price: 1,
    	image_url: '1.jpg') 
    assert !product.save
    assert_equal I18n.translate('errors.messages.taken'),
      product.errors[:title].join('; ')
  end

  test "title length must be 10 chars or more" do
    products(:valid_book).title = "< than 10"
    assert products(:valid_book).invalid?
    assert_equal 'Title have to be not less that 10 chars long' , products(:valid_book).errors[:title].join('; ')
  end

end
