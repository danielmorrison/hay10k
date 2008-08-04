class InitialSchema < ActiveRecord::Migration
  
  class Race < ActiveRecord::Base
  end
  
  class Gender < ActiveRecord::Base
  end
  
  def self.up
    
    create_table "races" do |t|
      t.column "name", :string
      t.column "distance", :integer
    end
    
    add_index :races, :name
    add_index :races, :distance
    
    Race.create(:name => 'Hay 10k', :distance => '10')
    Race.create(:name => 'Hay 5k', :distance => '5')
    Race.create(:name => 'Hay 2k', :distance => '2')
    
    create_table "people" do |t|
      t.column "first_name", :string
      t.column "last_name", :string
      t.column "age", :integer
      t.column "gender_id", :integer
      t.column "street", :string
      t.column "city", :string
      t.column "state", :string
      t.column "zip", :string
      t.column "race_id", :integer
    end
    
    create_table "genders" do |t|
      t.column "name", :string
    end

    Gender.create(:name => 'Men')
    Gender.create(:name => 'Women')
  end

  def self.down
    drop_table "races"
    drop_table "people"
    drop_table "genders"
  end
end
