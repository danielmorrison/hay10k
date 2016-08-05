if Rails.env.production?
  # API Key for h
  GOOGLE_MAPS_API_KEY = ''
else
  # localhost
  GOOGLE_MAPS_API_KEY = 'ABQIAAAAs9tdj1TSlnQYVEUc7eOZBBTJQa0g3IQ9GZqIMmInSLzwtGDKaBTohUAKB-4_HH04tdHM_kQYwa2YNw'
end
# Geocode.geocoder = Graticule.service(:google).new GOOGLE_MAPS_API_KEY