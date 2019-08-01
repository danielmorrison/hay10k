# == Schema Information
#
# Table name: age_groups
#
#  id        :integer(11)     not null, primary key
#  low       :integer(11)
#  high      :integer(11)
#  gender_id :integer(11)
#  race_id   :integer(11)
#

require File.dirname(__FILE__) + "/../test_helper"

class AgeGroupTest < Test::Unit::TestCase
  fixtures :age_groups

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
