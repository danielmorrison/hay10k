# == Schema Information
#
# Table name: races
#
#  id       :integer(11)     not null, primary key
#  name     :string(255)
#  distance :integer(11)
#  year_id  :integer(11)
#

require File.dirname(__FILE__) + '/../test_helper'

class RaceTest < Test::Unit::TestCase
  fixtures :races

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
