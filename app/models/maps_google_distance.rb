require 'httparty'
class MapsGoogleDistance

  #100 elements per query.
  #100 elements per 10 seconds.
  #2 500 elements per 24 hour period.
  #TODO add in constructor the type of result and then add only that result, make cache from the response

  BASE_URL = 'http://maps.googleapis.com/maps/api/distancematrix/json?origins='
  DISTANCE_BY_TRAIN = 'train'
  DISTANCE_BY_CAR = 'car'
  DISTANCE_BY_AIR = 'air'
  SENSOR = 'false'

  BASE_CITY = 'Berlin'
  BASE_DESTINATION = 'Hamburg'
  def self.get_distance_by_train(from, destination)
    destination = BASE_CITY if destination.nil?
    response = HTTParty.get(BASE_URL)
    puts response.body
  end

  def self.get_distance_by_car(from, destination)
    destination = BASE_CITY if destination.nil?
  end

  def self.get_distance_by_air(from, destination)
    destination = BASE_CITY if destination.nil?
  end

end
MapsGoogleDistance.get_distance_by_train('Berlin', 'Hamburg')