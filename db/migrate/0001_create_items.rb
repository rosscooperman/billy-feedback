class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :token
      t.string :content
      t.string :image
      t.string :cropped_image

      t.timestamps
    end
  end
end

