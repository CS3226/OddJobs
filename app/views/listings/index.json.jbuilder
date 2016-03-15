json.array!(@listings) do |listing|
  json.extract! listing, :id, :title, :description, :poster, :is_open?
  json.url listing_url(listing, format: :json)
end
