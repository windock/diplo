json.array!(@products) do |product|
  json.extract! product, :id, :internal_name, :product_name, :description, :concern, :skin_type, :sku
  json.url product_url(product, format: :json)
end
