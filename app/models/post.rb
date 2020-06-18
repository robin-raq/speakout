class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, as: :commentable, dependent: :destroy
  # Active Storage Rails 5
  has_one_attached :thumbnail
  has_one_attached :banner
  # Action text from Rails 6
  has_rich_text :body

  validates :title, length: {minimum: 5}
  validates :body, length: {minimum: 25}

  self.per_page =10
  extend FriendlyId
  friendly_id :title, use: :slugged

  # resize images with image variance
  def optimized_image(image, x, y)
    return image.variant(resize_to_fill: [x,y]).processed
  end
end
