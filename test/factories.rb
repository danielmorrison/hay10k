Factory.define :person do |f|
  f.gender      { Gender.female }
  f.first_name  "Amy"
  f.last_name   "Body"
  f.age         30
  f.city        "Pickford"
end

Factory.define :registration do |f|
  f.association :person
  f.association :year
  f.association :race
end

Factory.define :race do |f|
  f.name "Hay 10K"
end

Factory.define :year do |f|
  f.year 1990
end
