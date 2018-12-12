class StationService 
  
  def get_stations(zip)
    get_json("/api/alt-fuel-stations/v1.nearest.json?api_key=#{ENV['api_key']}&fuel_type=ELEC,LPG&location=#{zip}&limit=10&radius=6")
  end
  
  def get_json(url)
   response = conn.get(url)
   JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(:url => 'https://developer.nrel.gov') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end
end 