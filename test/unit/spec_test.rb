require 'test_helper'

class SpecTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Spec.new.valid?
  end
end
