# == Schema Information
# Schema version: 5
#
# Table name: people
#
#  id         :integer(11)   not null, primary key
#  first_name :string(255)   
#  last_name  :string(255)   
#  age        :integer(11)   
#  gender_id  :integer(11)   
#  street     :string(255)   
#  city       :string(255)   
#  state      :string(255)   
#  zip        :string(255)   
#  race_id    :integer(11)   
#  number     :integer(11)   
#

class Person < ActiveRecord::Base
  belongs_to  :gender
  belongs_to  :race
  has_one  :finish
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  validates_presence_of :gender
  validates_presence_of :age
  validates_numericality_of :age
  
  validates_presence_of :city
  
  acts_as_geocodable :address => {:street => :street, :locality => :city, :region => :state, :postal_code => :zip}
  
  def time
    finish ? finish.time : ''
  end
  
  def place
    people = race.people.find(:all, :order => "finishes.place", :include => :finish)
    rank_in_group(people)
  end
  
  def place_in_age_group
    if race.overall_winners_for_gender(gender).include?(self)
      race.overall_winners_for_gender(gender).index(self) + 1 
    else
      self.age_group.people.reject{|p| race.overall_winners_for_gender(gender).include?(p) }.index(self) + 1
    end
  end
  
  def readable_place_in_age_group(limit=4)
    # only talk about a few
    place = place_in_age_group
    if time.blank? || place && place > limit
      '' 
    elsif race.overall_winners_for_gender(gender).include?(self)
      # eliminate the overalls
      "#{number_to_ordinal(place)} #{gender}'s Overall" 
    else
      "#{number_to_ordinal(place)} in #{age_group.name}"
    end
  end
  
  
  def name
    "#{first_name} #{last_name}"
  end
  
  def hometown
    "#{city}, #{state}"
  end
  
  def country
    zip =~ /[^\d]/ ? 'Canada' : ''
  end
  
  def age_group
    race.age_groups.find(:first, 
      :conditions => ['low <= :age AND high >= :age AND gender_id = :gender', {:age => self.age, :gender => self.gender_id}])
  end
  
private

  def rank_in_group(people)    
    place = people.index(self)
    
    while place > 0 && people[place-1].time == self.time
      place -= 1
    end
    
    place + 1
  end
  
  # from: http://www.bigbold.com/snippets/posts/show/593
  def number_to_ordinal(num)
    num = num.to_i
    if (10...20)===num
      "#{num}th"
    else
      g = %w{ th st nd rd th th th th th th }
      a = num.to_s
      c=a[-1..-1].to_i
      a + g[c]
    end
  end
end