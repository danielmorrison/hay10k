# encoding: UTF-8
# == Schema Information
#
# Table name: races
#
#  id       :integer(11)     not null, primary key
#  name     :string(255)
#  distance :integer(11)
#  year_id  :integer(11)
#

class Race < ActiveRecord::Base
  has_many :registrations
  has_many  :people, :through => :registrations
  has_many  :age_groups
  belongs_to :year

  def overall_winners_for_gender(gender)
    people.finished.where(gender_id: gender).order('finishes.place').includes(:finishes).limit(1)
  end

  def age_distribution
    people.select('age, COUNT(people.id) AS sum').order(:age).group('age').each do |x|
      puts "#{x.age}: #{'•'*x.sum.to_i}"
    end
    true
  end

  def to_s
    name
  end

  def short_name
    "#{distance}k"
  end
end
