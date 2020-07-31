class AddImageDataToEducationContents < ActiveRecord::Migration[5.2]
  def change
    add_column :education_contents, :image_data, :text
  end
end
