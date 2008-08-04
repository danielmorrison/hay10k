class AlterPeople < ActiveRecord::Migration
  def self.up
    add_column "people", "number", :integer
  end

  def self.down
    remove_column "people", "number"
  end
end
