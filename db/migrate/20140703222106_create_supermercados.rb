class CreateSupermercados < ActiveRecord::Migration
  def change
    create_table :supermercados do |t|
      t.string :logo
      t.string :nombre

      t.timestamps
    end
  end
end
