class RemoveContentFromEducationContent < ActiveRecord::Migration[5.2]
  def change
    remove_column :education_contents, :content, :text
  end
end
