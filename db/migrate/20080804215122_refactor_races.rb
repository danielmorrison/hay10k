class RefactorRaces < ActiveRecord::Migration
  class Race < ActiveRecord::Base
    belongs_to :year
  end

  class Year < ActiveRecord::Base
    has_many :races
  end

  class Person < ActiveRecord::Base
    has_many :registrations
    belongs_to :race
  end

  class Registration < ActiveRecord::Base
    belongs_to :race
    belongs_to :person
    belongs_to :year
  end

  class Finish < ActiveRecord::Base
    belongs_to :person
    belongs_to :year
  end

  def self.up
    # create_table "registrations" do |t|
    #   t.integer :person_id
    #   t.integer :race_id
    #   t.integer :year_id
    #   t.integer :lock_version, :default => 0
    #   t.timestamps
    # end
    #
    # Person.all.each do |person|
    #   Registration.create :person_id => person.id, :race_id => person.race_id, :year_id => person.race.year_id
    # end
    #
    # add_column "finishes", "year_id", :integer
    #
    Finish.all.each do |finish|
      finish.update_attribute :year_id, finish.person ? finish.person.race.year_id : Year.first.id
    end

    remove_column "people", "race_id"
  end

  def self.down
    add_column :people, :race_id, :integer

    Registration.all.each do |registration|
      registration.person.update_attribute :race_id, registration.race_id
    end

    drop_table "registrations"
    remove_column "finishes", "year_id"
  end
end
