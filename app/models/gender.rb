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
  
  validates :name, :uniqueness => true
  
  default_scope order('name DESC')
  
  def self.male
    Gender.find_or_create_by_name('Men')
  end
  
  def self.female
    Gender.find_or_create_by_name('Women')
  end
  
  def to_s
    name
  end
end
