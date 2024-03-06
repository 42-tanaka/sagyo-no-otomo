class Post < ApplicationRecord
  mount_uploader :image, PostImageUploader

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 255 }

  enum category: { food: 0, drink: 1 }
end
