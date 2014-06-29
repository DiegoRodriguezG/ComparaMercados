class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.text :imagen
      t.text :descripcion
      t.text :precio

      t.timestamps
    end
  end
end
