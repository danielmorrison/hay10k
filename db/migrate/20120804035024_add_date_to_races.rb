class AddDateToRaces < ActiveRecord::Migration
  def self.up
    add_column :races, :date, :date
  end

  def self.down
    remove_column :races, :date
  end
end
