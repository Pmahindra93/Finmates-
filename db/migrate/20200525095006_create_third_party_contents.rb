class CreateThirdPartyContents < ActiveRecord::Migration[5.2]
  def change
    create_table :third_party_contents do |t|
      t.string :title
      t.text :description
      t.string :link

      t.timestamps
    end
  end
end
