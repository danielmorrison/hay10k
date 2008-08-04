class CreateAgeGroups < ActiveRecord::Migration
  
  class AgeGroup < ActiveRecord::Base
    belongs_to  :gender
    belongs_to  :race
  end
  
  class Gender < ActiveRecord::Base
  end
  
  class Race < ActiveRecord::Base
  end
  
  def self.up
    create_table :age_groups do |t|
      t.column "low", :integer
      t.column "high", :integer
      t.column "gender_id", :integer
      t.column "race_id", :integer
    end
    
    
    [[14,19],
    [20,29],
    [30,39],
    [40,49],
    [50,59],
    [60,99] ].each do |low, high|
      Gender.find(:all).each do |gender|
        [10,5].each do |distance|
          AgeGroup.create(:low => low, 
                          :high => high, 
                          :gender => gender, 
                          :race => Race.find_by_distance(distance) )
        end
      end
    end
    
    
  end

  def self.down
    drop_table :age_groups
  end
end
