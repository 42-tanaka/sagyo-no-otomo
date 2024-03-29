class Profile < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  belongs_to :user

  validates :name, presence: true, length: { maximum: 255 }
end
