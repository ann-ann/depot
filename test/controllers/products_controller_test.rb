# был ли веб запрос успешным?
# был ли пользователь перенаправлен на правильную страницу?
# был ли пользователь успешно аутентифицирован?
# был ли правильный объект сохранен в шаблон отклика?
# было ли подходящее сообщение отражено для пользователя во вьюхе

require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
      @update = {
        title: 'Lorem ipsum',
        description: 'Wibbles are fun!',
        image_url: 'cs.png',
        price: 9.99
      }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
    assert_equal assigns(:products).count, 4

    assert_template :index
    assert_template layout: "layouts/application"

    assert_select "#columns #main tr", 4
  end

  test "should get new" do
    get :new
    assert_response :success

    assert_template layout: "layouts/application", partial: "_form"

    assert_select "#product_title"
    assert_select "#product_description"
    assert_select "#product_description"
    assert_select "#product_image_url"
    assert_select "#product_price"
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: @update
    end

    assert_redirected_to product_path(assigns(:product))
    assert_equal 'Product was successfully created.', flash[:notice]
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success

    assert_template :show
    assert_template layout: "layouts/application"
    
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success

    assert_template layout: "layouts/application", partial: "_form"
  end

  test "should update product" do
    patch :update, id: @product, product: @update
    assert_redirected_to product_path(assigns(:product))
    assert_equal 'Product was successfully updated.', flash[:notice]
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
    assert_equal 'Product was deleted.', flash[:notice]
  end
end
