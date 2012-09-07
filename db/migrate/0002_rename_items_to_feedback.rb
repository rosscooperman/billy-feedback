class RenameItemsToFeedback < ActiveRecord::Migration
  def change
    rename_table :items, :feedback
  end
end

