class GiphySerializer
  include FastJsonapi::ObjectSerializer
  attributes :giphy_service_objects,
             :copyright
end
