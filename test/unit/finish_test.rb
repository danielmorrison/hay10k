# == Schema Information
#
# Table name: finishes
#
#  id        :integer(11)     not null, primary key
#  place     :integer(11)
#  time      :string(255)
#  person_id :integer(11)
#  year_id   :integer(11)
#

require File.dirname(__FILE__) + '/../test_helper'

class FinishTest < Test::Unit::TestCase
  fixtures :finishes

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
