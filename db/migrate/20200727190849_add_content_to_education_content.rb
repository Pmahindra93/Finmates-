class AddContentToEducationContent < ActiveRecord::Migration[5.2]
  def change
    add_column :education_contents, :edu_content, :text
  end
end
