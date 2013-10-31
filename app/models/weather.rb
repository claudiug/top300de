class Weather

  def initialize(trip)
    @trip = trip
  end

  def get_weather
    forecast ||= ForecastIO.forecast(@trip.latitude, @trip.longitude, params: { units: 'si', exclude: 'minutely,currently,flags,alerts,hourly'})
  end
end