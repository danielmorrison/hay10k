class AddYearToFinish < ActiveRecord::Migration
  def self.up
    add_column "finishes", "year_id", :integer
    Finish.find(:all).each do |f|
      f.update_attribute :year_id, Year.find_by_year(2007)
    end
  end

  def self.down
    remove_column "finishes", "year_id"
  end
end
