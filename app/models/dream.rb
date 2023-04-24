class Dream < ApplicationRecord
  validates :dream_list, null: false
  validates :cost, numericality: { only_integer: true, message: 'は半角数値を使用してください' }
  validates :due
  validates :memo
  
  belongs_to :user
end
