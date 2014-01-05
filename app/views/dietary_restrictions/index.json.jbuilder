json.array!(@dietary_restrictions) do |dietary_restriction|
  json.extract! dietary_restriction, :id
  json.url dietary_restriction_url(dietary_restriction, format: :json)
end
