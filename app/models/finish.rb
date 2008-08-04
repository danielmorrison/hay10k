# == Schema Information
# Schema version: 5
#
# Table name: finishes
#
#  id        :integer(11)   not null, primary key
#  place     :integer(11)   
#  time      :string(255)   
#  person_id :integer(11)   
#

class Finish < ActiveRecord::Base
  belongs_to :person
  belongs_to :year
  
  named_scope :for_race, lambda{|race| {:conditions => {:year_id => race.year}}}
  
  def number
    person.blank? ? nil : person.number
  end
  
end
