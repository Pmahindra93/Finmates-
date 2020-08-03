class RemoveImageDataFromEducationContent < ActiveRecord::Migration[5.2]
  def change
    remove_column :education_contents, :image_data, :text
  end
end
