require File.dirname(__FILE__) + '/../test_helper'
require 'finishes_controller'

# Re-raise errors caught by the controller.
class FinishesController; def rescue_action(e) raise e end; end

class FinishesControllerTest < Test::Unit::TestCase
  fixtures :finishes

  def setup
    @controller = FinishesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:finishes)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:finish)
    assert assigns(:finish).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:finish)
  end

  def test_create
    num_finishes = Finish.count

    post :create, :finish => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_finishes + 1, Finish.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:finish)
    assert assigns(:finish).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil Finish.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Finish.find(1)
    }
  end
end
