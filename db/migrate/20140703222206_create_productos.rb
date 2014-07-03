class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :imagen
      t.string :descripcion
      t.string :precio
      t.integer :supermercado_id

      t.timestamps
    end
  end
end
