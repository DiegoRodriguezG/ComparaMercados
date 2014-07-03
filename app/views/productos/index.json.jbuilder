json.array!(@productos) do |producto|
  json.extract! producto, :id, :imagen, :descripcion, :precio, :supermercado_id
  json.url producto_url(producto, format: :json)
end
