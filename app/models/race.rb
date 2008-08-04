# == Schema Information
# Schema version: 5
#
# Table name: races
#
#  id       :integer(11)   not null, primary key
#  name     :string(255)   
#  distance :integer(11)   
#

class Race < ActiveRecord::Base
  has_many  :people
  has_many  :age_groups
  belongs_to :year
  
  def overall_winners_for_gender(gender)
    people.find(:all, :limit => 3, :conditions => {:gender_id => gender}, :order => 'finishes.place', :include => :finish)
  end
  
  def age_distribution
    people.find(:all, :select => 'age, COUNT(id) AS sum', :order => 'age', :group => 'age').each{|x| puts "#{x.age}: #{'*'*x.sum.to_i}"}
  end
  
  def to_s
    name
  end
end
