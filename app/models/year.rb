class Year < ActiveRecord::Base
  has_many :races
  
  def to_param
    year
  end
  
  def to_s
    year.to_s
  end
end
