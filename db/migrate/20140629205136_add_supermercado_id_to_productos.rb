class AddSupermercadoIdToProductos < ActiveRecord::Migration
  def change
  	add_column :productos, :supermercado_id, :integer
  end
end
