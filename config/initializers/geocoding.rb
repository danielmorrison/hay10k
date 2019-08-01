GOOGLE_MAPS_API_KEY = if Rails.env.production?
  # API Key for h
  ""
else
  # localhost
  "ABQIAAAAs9tdj1TSlnQYVEUc7eOZBBTJQa0g3IQ9GZqIMmInSLzwtGDKaBTohUAKB-4_HH04tdHM_kQYwa2YNw"
end
# Geocode.geocoder = Graticule.service(:google).new GOOGLE_MAPS_API_KEY
