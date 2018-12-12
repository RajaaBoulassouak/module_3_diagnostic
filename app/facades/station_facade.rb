class StationFacade
  
  def initialize(zip)
    @zip = zip
  end
  
  def stations
    data = station_service.get_stations(@zip)
    data[:fuel_stations].each do |station_data|
      Station.new(station_data)
    end
  end
  
  private 
  
  def station_service
    StationService.new 
  end
end 