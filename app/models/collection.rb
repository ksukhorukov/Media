class Collection < ActiveRecord::Base
  has_many :items, dependent: :destroy
  validates_presence_of :user_id
  validates :name, :description, presence: true
end
