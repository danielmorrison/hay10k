# == Schema Information
#
# Table name: years
#
#  id         :integer(11)     not null, primary key
#  year       :integer(11)
#  created_at :datetime
#  updated_at :datetime
#

class Year < ActiveRecord::Base
  has_many :races
  has_many :finishes
  has_many :registrations
  has_many :people, :through => :registrations
  
  def to_param
    year.to_s
  end
  
  def to_s
    year.to_s
  end
end
