module SearchHelperConcern
  extend ActiveSupport::Concern

  def verify_search search
    if search.validate
      perform_search search
    end
  end

  def perform_search search
    location_and_search_id = get_lat_and_long_from_address search.address
    if location_and_search_id.length > 1
      location_and_search_id
    else
      nil
    end
  end

end