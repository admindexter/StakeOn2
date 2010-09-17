require 'test_helper'

class FaqsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_edit
    get :edit, :id => Faq.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Faq.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Faq.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Faq.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Faq.first
    assert_redirected_to faqs_url
  end
end
