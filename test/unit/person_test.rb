# == Schema Information
#
# Table name: people
#
#  id         :integer(11)     not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  age        :integer(11)
#  gender_id  :integer(11)
#  street     :string(255)
#  city       :string(255)
#  state      :string(255)
#  zip        :string(255)
#  number     :integer(11)
#

require File.dirname(__FILE__) + '/../test_helper'

class PersonTest < Test::Unit::TestCase
  fixtures :people

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
