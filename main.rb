require_relative 'fetch_data'
url_regions = 'https://pinballmap.com/api/v1/regions.json'

# crear nuevo objeto que se llama regions_data con data de regions
regions_data = FetchData.new(url_regions)
data_regions = regions_data.parse_data

# crear un array con todas las regiones
region_name = data_regions["regions"].map { |region| region["name"] }

# crear un array con los ids de regiones sorteado por menor a mayor
regions_sorted_by_id = data_regions["regions"].map { |region| region["id"] }.sort

# crear nuevo objeto y iterar las primeras 5 regiones para sacar los ids de ubicaciones
region_name.first(5).map { |region|
  url_location_by_region = "https://pinballmap.com/api/v1/locations.json?region=#{region}"
  location_data = FetchData.new(url_location_by_region)
  data_location = location_data.parse_data
  location_array = data_location["locations"].map { |x, y| x['id'] }
  # sum of machines
  sum_machines_by_location = data_location["locations"].map { |x| x['num_machines'] }.sum
}
