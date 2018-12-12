class StationFacade 
  
  def initialize(zip)
    @zip = zip
  end
  
  def stations
    data = station_service.get_stations(@zip)
  end
  
  private 
  
  def station_service
    StationService.new 
  end
end 