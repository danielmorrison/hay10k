class Registration < ActiveRecord::Base
  belongs_to :race
  belongs_to :person
  belongs_to :year
end
