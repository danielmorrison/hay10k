class AddMissingTimestamps < ActiveRecord::Migration
  def self.up
    add_column :age_groups, :created_at, :datetime
    add_column :age_groups, :updated_at, :datetime

    add_column :finishes, :created_at, :datetime
    add_column :finishes, :updated_at, :datetime

    add_column :people, :created_at, :datetime
    add_column :people, :updated_at, :datetime
  end

  def self.down
    remove_column :age_groups, :created_at, :datetime
    remove_column :age_groups, :updated_at, :datetime

    remove_column :finishes, :created_at, :datetime
    remove_column :finishes, :updated_at, :datetime

    remove_column :people, :created_at, :datetime
    remove_column :people, :updated_at, :datetime
  end
end
