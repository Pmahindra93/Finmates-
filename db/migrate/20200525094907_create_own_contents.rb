class CreateOwnContents < ActiveRecord::Migration[5.2]
  def change
    create_table :own_contents do |t|
      t.string :title
      t.string :description
      t.string :article
      t.string :category

      t.timestamps
    end
  end
end
