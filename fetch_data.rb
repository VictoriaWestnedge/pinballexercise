require 'json'
require 'open-uri'

class FetchData
  def initialize(url)
    @url = url
  end

  def parse_data
    results = URI.open(@url).read
    results_hash = JSON.parse(results)
  end

end
