class CreateFinishes < ActiveRecord::Migration
  def self.up
    create_table :finishes do |t|
      t.column "place", :integer
      t.column "time",  :string
    end
    
    add_column "people", "finish_id", :integer
  end

  def self.down
    drop_table :finishes
    remove_column "people", "finish_id"
  end
end
