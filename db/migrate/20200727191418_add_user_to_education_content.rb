class AddUserToEducationContent < ActiveRecord::Migration[5.2]
  def change
    add_reference :education_contents, :user, foreign_key: true
  end
end
