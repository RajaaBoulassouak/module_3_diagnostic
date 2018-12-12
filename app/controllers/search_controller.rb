class SearchController < ApplicationController
  def index
    require "pry"; binding.pry
    @facade = StationFacade.new(params[:zip_code])
  end
end