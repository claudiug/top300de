require 'httparty'
class MapsGoogleDistance

  #100 elements per query.
  #100 elements per 10 seconds.
  #2 500 elements per 24 hour period.
  #TODO add in constructor the type of result and then add only that result, make cache from the response

  BASE_URL = 'http://maps.googleapis.com/maps/api/distancematrix/json?origins='
  DISTANCE_BY_WALKING = 'walking'
  DISTANCE_BY_CAR = 'driving'
  DISTANCE_BY_BIKE = 'air'
  SENSOR = 'false'

  BASE_CITY = 'Berlin'
  BASE_DESTINATION = 'Hamburg'
  def self.get_distance_by_walking(from, destination)
    value = []
    from = BASE_CITY if from.nil?
    destination = BASE_CITY if destination.nil?
    response = HTTParty.get(BASE_URL +
                                from +
                                '&destinations='+ destination +
                                '&mode=' + DISTANCE_BY_WALKING +
                                '&sensor='+SENSOR )
    if response.code == 200
      result = JSON(response.body)
      distance = result['rows'][0]['elements'][0]['distance']['text']
      time =  result['rows'][0]['elements'][0]['duration']['text']
      value << time
      value << distance
    end
  end

  def self.get_distance_by_car(from, destination)
    value = []
    from = BASE_CITY if from.nil?
    destination = BASE_CITY if destination.nil?
    response = HTTParty.get(BASE_URL +
                                from +
                                '&destinations='+ destination +
                                '&mode=' + DISTANCE_BY_CAR +
                                '&sensor='+SENSOR )
    if response.code == 200
      result = JSON(response.body)
      distance = result['rows'][0]['elements'][0]['distance']['text']
      time =  result['rows'][0]['elements'][0]['duration']['text']
      value << time
      value << distance
    end
  end

  def self.get_distance_by_bike(from, destination)
    value = []
    from = BASE_CITY if from.nil?
    destination = BASE_CITY if destination.nil?
    response = HTTParty.get(BASE_URL +
                                from +
                                '&destinations='+ destination +
                                '&mode=' + DISTANCE_BY_BIKE +
                                '&sensor='+SENSOR )
    if response.code == 200
      result = JSON(response.body)
      distance = result['rows'][0]['elements'][0]['distance']['text']
      time =  result['rows'][0]['elements'][0]['duration']['text']
      value << time
      value << distance
    end
  end

end
p MapsGoogleDistance.get_distance_by_walking('Berlin', 'Hamburg')