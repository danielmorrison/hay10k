class CreateYears < ActiveRecord::Migration
  def self.up
    create_table :years do |t|
      t.integer :year
      t.timestamps
    end
    
    add_column "races", "year_id", :integer
    add_index "races", "year_id"
    
    oh_seven = Year.find_or_create_by_year(2007)
    oh_eight = Year.find_or_create_by_year(2008)
    
    Race.find(:all).each do |race| 
      race.update_attribute :year_id, oh_seven
      clone = race.clone
      clone.year = oh_eight
      clone.save!
    end
  end

  def self.down
    drop_table :years
    remove_column "races", "year_id"
  end
end
