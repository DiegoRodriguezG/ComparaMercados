json.array!(@supermercados) do |supermercado|
  json.extract! supermercado, :id, :logo, :nombre
  json.url supermercado_url(supermercado, format: :json)
end
