class Weather
  def initialize(trip)
    @trip = trip
  end

  def get_weather
    ForecastIO.forecast(@trip.latitude, @trip.longitude,
                                     params: { units: 'si',
                                     exclude: 'minutely,flags,alerts,hourly'})
  end
end
