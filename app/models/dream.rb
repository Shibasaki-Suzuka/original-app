class Dream < ApplicationRecord
  with_options presence: true do
    validates :dream_list
    validates :cost, allow_blank: true
    validates :due,  allow_blank: true
    validates :memo, allow_blank: true
  end

  MAX_COUNT = 100
  validate :validate_count

  belongs_to :user
  has_one :achieve

  private

  def validate_count
    current_count = Dream.count
    return unless current_count + (MAX_COUNT - current_count) < user.dreams.size

    errors.add(:base, "夢は最大#{MAX_COUNT}件までしか登録できません")
  end
end
