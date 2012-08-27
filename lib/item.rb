class Item < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  mount_uploader :cropped_image, ImageUploader
end
