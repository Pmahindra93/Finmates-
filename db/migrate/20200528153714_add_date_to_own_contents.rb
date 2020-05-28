class AddDateToOwnContents < ActiveRecord::Migration[5.2]
  def change
    add_column :own_contents, :published_date, :date
  end
end
