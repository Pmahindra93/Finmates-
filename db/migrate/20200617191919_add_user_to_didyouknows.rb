class AddUserToDidyouknows < ActiveRecord::Migration[5.2]
  def change
    add_reference :didyouknows, :user, foreign_key: true
  end
end
