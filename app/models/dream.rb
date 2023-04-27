class Dream < ApplicationRecord
  validates :dream_list, presence: true
  validates :cost, format: { with: /\A[0-9]+\z/, message: 'は半角数値を使用してください' }, allow_blank: true
  
  MAX_COUNT = 100
  validate :validate_count

  belongs_to :user

  private
  def validate_count
    current_count = Dream.count
    if current_count + (MAX_COUNT - current_count) < user.dreams.size
      errors.add(:base, "夢は最大#{MAX_COUNT}件までしか登録できません")
    end
  end

end
