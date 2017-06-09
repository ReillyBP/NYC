class NyCsController < ApplicationController
  def index
    # @nycs = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22nome%2C%20ak%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys").body

    # @sunsets = @nycs["query"]["results"]["channel"]["astronomy"]
    # @forecasts = @nycs["query"]["results"]["channel"]["item"]["forecast"]
    nycs = Weather.lookup_by_location('New York, NY', Weather::Units::FAHRENHEIT)
    @forecasts = nycs.forecasts
    @celsius = (nycs.condition.temp - 32) * 5 / 9
    @image = nycs.image
    render "index.html.erb"

  end

end
