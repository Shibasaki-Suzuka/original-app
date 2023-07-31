class Dream < ApplicationRecord
  with_options presence: true do
    validates :dream_list
    validates :cost, allow_blank: true
    validates :due,  allow_blank: true
    validates :memo, allow_blank: true
  end
  belongs_to :user
  has_one :achieve
  has_many :likes

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  MAX_COUNT = 100
  validate :validate_count, on: :create

  private

  def validate_count
    return unless user && user.dreams.count >= MAX_COUNT

    errors.add(:base, message: "夢は#{MAX_COUNT}個まで登録できます")
  end
end
