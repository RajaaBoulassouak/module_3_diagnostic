class StationService
  
  def get_stations(zip)
    get_json("/api/alt-fuel-stations/v1/nearest.json?&location=#{zip}&radius=6&fuel_type=ELEC,LPG&limit=10")
  end
  
  def get_json(url)
   response = conn.get(url)
   JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(:url => 'https://developer.nrel.gov') do |faraday|
      faraday.headers["X-API-KEY"] = ENV['api_key']
      faraday.adapter  Faraday.default_adapter
    end
  end
end