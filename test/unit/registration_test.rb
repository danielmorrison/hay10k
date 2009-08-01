# == Schema Information
#
# Table name: registrations
#
#  id           :integer(11)     not null, primary key
#  person_id    :integer(11)
#  race_id      :integer(11)
#  year_id      :integer(11)
#  lock_version :integer(11)     default(0)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class RegistrationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
