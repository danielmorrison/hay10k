class Year < ActiveRecord::Base
  has_many :races
  
  def to_param
    year
  end
end
