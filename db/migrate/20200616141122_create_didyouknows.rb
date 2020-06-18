class CreateDidyouknows < ActiveRecord::Migration[5.2]
  def change
    create_table :didyouknows do |t|
      t.text :title
      t.text :description
      t.text :article
      t.datetime :published_date

      t.timestamps
    end
  end
end
