class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  CATEGORY = ["chinese", "italian", "japanese", "french", "belgian"]
  validates :category, inclusion: { in: CATEGORY }

  def average
    average_rating = self.reviews.pluck(:rating)
    average_rating.sum.fdiv(average_rating.length)
  end
end
