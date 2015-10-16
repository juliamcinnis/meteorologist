require 'open-uri'

class ForecastController < ApplicationController
  def coords_to_weather_form
    # Nothing to do here.
    render("coords_to_weather_form.html.erb")
  end

  def coords_to_weather
    @lat = params[:user_latitude]
    @lng = params[:user_longitude]

    # ==========================================================================
    # Your code goes below.
    # The latitude the user input is in the string @lat.
    # The longitude the user input is in the string @lng.
    # ==========================================================================
    
    url = 'https://maps.googleapis.com/maps/api/geocode/json?address=' + url_safe_street_address 
    parsed_data = JSON.parse(open(url).read)
    @latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    @longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

   url_weather = 'https://api.forecast.io/forecast/31db0a0d74d30622c7f85adcd75afc4e/'+'lat'+'lng'

    parsed_data_2 = JSON.parse(open(url_weather).read)

    @current_temperature = parsed_data_2["currently"]["temperature"]

    @current_summary = parsed_data_2["currently"]["summary"]

    @summary_of_next_sixty_minutes = parsed_data_2["minutely"]["summary"]

    @summary_of_next_several_hours = parsed_data_2["hourly"]["summary"]

    @summary_of_next_several_days = parsed_data_2["daily"]["summary"]

    render("coords_to_weather.html.erb")
  end
end
