# == Schema Information
#
# Table name: finishes
#
#  id        :integer(11)     not null, primary key
#  place     :integer(11)
#  time      :string(255)
#  person_id :integer(11)
#  year_id   :integer(11)
#

class Finish < ActiveRecord::Base
  belongs_to :person
  belongs_to :year
  
  scope :for_race, lambda{|race| where(:year_id => race.year) }
  
  default_scope order('place')
  
  def number
    person.blank? ? nil : person.number
  end
  
  def number=(n)
    if n.present?
      self.person = year.people.find_by_number(n)
      self.errors.add(:person_id, 'invalid person_id') if person.blank?
    end
  end
  
end
