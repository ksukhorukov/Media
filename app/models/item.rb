class Item < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates_presence_of :collection_id, :user_id, :type_id, :name, :description
end
