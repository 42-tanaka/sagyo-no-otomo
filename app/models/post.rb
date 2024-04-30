class Post < ApplicationRecord
  mount_uploader :image, PostImageUploader

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 255 }

  enum category: { food: 0, drink: 1 }

  scope :eaten, -> { where(eaten: true) }
  scope :smelly, -> { where(smell: true) }
  scope :noisy, -> { where(sound: true) }
  scope :spilly, -> { where(spill: true) }
  scope :dirty_hands, -> { where(hands_dirty: true) }
  scope :by_category, ->(category) { where(category: category) if category.present? }
  scope :recent, -> { order(created_at: :desc) }

end
