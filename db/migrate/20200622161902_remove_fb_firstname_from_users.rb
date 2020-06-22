class RemoveFbFirstnameFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :fb_first_name, :string
  end
end
