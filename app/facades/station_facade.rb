class StationFacade 
  
  def initialize(zip_code)
    @zip_code = zip_code
  end
  
  def stations
    data = station_service.get_stations(zip_code)
  end
  
  private 
  
  def station_service
    StationService.new 
  end
end 