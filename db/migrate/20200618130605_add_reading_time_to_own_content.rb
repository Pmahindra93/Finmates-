class AddReadingTimeToOwnContent < ActiveRecord::Migration[5.2]
  def change
    add_column :own_contents, :reading_time, :string
  end
end
