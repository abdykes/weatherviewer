class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


end

class GetWeather < ActionController::Base
  #This class takes a zip code when instantiated and populates several attributes

  attr_accessor :city
  attr_accessor :state
  attr_accessor :lat
  attr_accessor :lon
  attr_accessor :temp_f

  def initialize(zipIn)

    open('http://api.wunderground.com/api/735c849d33f507e5/geolookup/conditions/q/'+zipIn+'.json') do |f|
      json_string = f.read
      parsed_json = JSON.parse(json_string)
      @city = parsed_json['location']['city']
      @state = parsed_json['location']['state']
      @lat = parsed_json['location']['lat']
      @lon = parsed_json['location']['lon']
      @temp_f = parsed_json['current_observation']['temp_f']

    end
  end
end