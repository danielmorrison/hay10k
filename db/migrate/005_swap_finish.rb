class SwapFinish < ActiveRecord::Migration
  def self.up
    add_column "finishes", "person_id", :integer
    remove_column "people", "finish_id"
  end

  def self.down
    remove_column "finishes", "person_id"
    add_column "people", "finish_id", :integer
  end
end
