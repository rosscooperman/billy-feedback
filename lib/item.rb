class Item
	include Mongoid::Document

	field :token, type: String
	field :content, type: String
	mount_uploader :image, ImageUploader
	mount_uploader :cropped_image, ImageUploader
end