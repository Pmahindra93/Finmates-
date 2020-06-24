class AddFbImageToUserTable < ActiveRecord::Migration[5.2]
  def change
    add_column :user_tables, :fb_image, :string
  end
end
