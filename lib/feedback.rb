# Attributes
# ==========
#
# integer  :id
# string   :token
# string   :content
# string   :image
# string   :cropped_image
# datetime :created_at
# datetime :updated_at
#

class Feedback < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  mount_uploader :cropped_image, ImageUploader
end
