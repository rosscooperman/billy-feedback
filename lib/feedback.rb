# Attributes
# ==========
#
# integer  :id
#
# string   :raw_text
# string   :original
# string   :processed
#
# datetime :created_at
# datetime :updated_at
#

class Feedback < ActiveRecord::Base
  mount_uploader :original,  ImageUploader
  mount_uploader :processed, ImageUploader
end
