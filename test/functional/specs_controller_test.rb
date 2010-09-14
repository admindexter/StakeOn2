require 'test_helper'

class SpecsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Spec.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Spec.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Spec.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to spec_url(assigns(:spec))
  end
  
  def test_edit
    get :edit, :id => Spec.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Spec.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Spec.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Spec.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Spec.first
    assert_redirected_to spec_url(assigns(:spec))
  end
  
  def test_destroy
    spec = Spec.first
    delete :destroy, :id => spec
    assert_redirected_to specs_url
    assert !Spec.exists?(spec.id)
  end
end
