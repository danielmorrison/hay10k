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

class AgeGroup < ActiveRecord::Base
  belongs_to  :gender
  belongs_to  :race
  
  validates_presence_of :low, :high, :gender, :race
  validates_numericality_of :low, :high
    
  def name
    if low == 0
      name = "#{high} and under"
    elsif high == 99
      name = "#{low} and up"
    else
      name = "#{low}-#{high}"
    end
    
    "#{gender.name} " + name
  end
  
  def people
    race.people.find(:all, :conditions => [':low <= age AND :high >= age AND gender_id = :gender', {:low => self.low, :high => self.high, :gender => self.gender_id}], :order => "finishes.place", :include => :finishes)
  end
  
end
