class RenameFeedbackFields < ActiveRecord::Migration
  def change
    rename_column :feedback, :content,       :raw_text
    rename_column :feedback, :image,         :original
    rename_column :feedback, :cropped_image, :processed

    remove_column :feedback, :token
  end
end

