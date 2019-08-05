# 2k
two_k_groups = [
  {low: 0, high: 6},
  {low: 7, high: 8},
  {low: 9, high: 10},
  {low: 11, high: 12},
  {low: 13, high: 99},
]

# 5 & 10k
five_k_groups = [
  {low: 0, high: 14},
  {low: 15, high: 19},
  {low: 20, high: 29},
  {low: 30, high: 39},
  {low: 40, high: 49},
  {low: 50, high: 59},
  {low: 60, high: 99},
]

# Ok, let's setup a new year
date = Date.new(2019, 8, 3)
year = Year.find_or_create_by(year: date.year)
[10, 5, 2].each do |distance|
  race = year.races.find_or_create_by(name: "Hay #{distance}k")
  race.update_attributes distance: distance, date: date

  age_groups = distance == 2 ? two_k_groups : five_k_groups
  age_groups.each do |age_group|
    Gender.all.each do |gender|
      race.age_groups.create! age_group.merge(gender: gender)
    end
  end
end
