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

  def test_create_finish
    @registration = Factory.build(:registration)
    
    assert_difference 'Finish.count', 1 do
      @registration.save
    end
  end

end
