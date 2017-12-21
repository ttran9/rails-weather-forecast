require 'net/http'
module GeocodeApiConcern
  extend ActiveSupport::Concern

  def create_request_from_address address
    geocode_API_key = ENV['GOOGLE_MAPS_GC_KEY']
    geocode_request_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{uri_encode_entered_address address}&key=#{geocode_API_key}"
    url = URI(geocode_request_url)
    Net::HTTP.get(url) # make the request and return the json body contents
  end

  def get_lat_and_long_from_address address
    search_result = create_request_from_address address

    search_id = store_user_search_if_logged_in address
    json = JSON.parse(search_result)
    results_array = json['results']

    if check_for_results results_array
      location_and_search_id = results_array[0]['geometry']['location']
      if search_id
        [location_and_search_id['lat'], location_and_search_id['lng'], search_id.id] # return both the lat and lng inside of an array.
      else
        [location_and_search_id['lat'], location_and_search_id['lng']]
      end
    else
      [] # return an empty array.
    end
  end

  def check_for_results results_array
    if results_array.length == 0
      false
    else
      true
    end
  end

  def store_user_search_if_logged_in address
    if current_user
      # do not store the escaped string address.
      Search.create(address: address, user_id: current_user.id)
    end
  end

  def uri_encode_entered_address address
    URI.encode(address)
  end

end