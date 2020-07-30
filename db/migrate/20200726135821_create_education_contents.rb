class CreateEducationContents < ActiveRecord::Migration[5.2]
  def change
    create_table :education_contents do |t|
      t.text :title
      t.text :description
      t.text :content

      t.timestamps
    end
  end
end
