# == Schema Information
#
# Table name: genders
#
#  id   :integer(11)     not null, primary key
#  name :string(255)
#

class Gender < ActiveRecord::Base
  has_many  :people
  has_many  :age_groups
  
  validates_uniqueness_of :name
  
  def to_s
    name
  end
end
