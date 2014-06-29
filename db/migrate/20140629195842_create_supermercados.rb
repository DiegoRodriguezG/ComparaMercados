class CreateSupermercados < ActiveRecord::Migration
  def change
    create_table :supermercados do |t|
      t.text :logo
      t.text :nombre

      t.timestamps
    end
  end
end
