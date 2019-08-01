# == Schema Information
#
# Table name: genders
#
#  id   :integer(11)     not null, primary key
#  name :string(255)
#

require File.dirname(__FILE__) + "/../test_helper"

class GenderTest < Test::Unit::TestCase
  fixtures :genders

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
