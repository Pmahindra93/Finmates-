class DropFotos < ActiveRecord::Migration[5.2]
  def change
    drop_table :fotos
  end
end
