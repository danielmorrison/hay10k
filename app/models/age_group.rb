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

  validates :low, :high, :gender, :race, presence: true
  validates :low, :high, numericality: true

  def name
    name = if low == 0
      "#{high} and under"
    elsif high == 99
      "#{low} and up"
    else
      "#{low}-#{high}"
    end

    "#{gender.name} " + name
  end

  def people
    race.people.where([":low <= age AND :high >= age AND gender_id = :gender", {low: low, high: high, gender: gender_id}]).order("finishes.place").includes(:finishes)
  end
end
