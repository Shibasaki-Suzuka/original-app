class Dream < ApplicationRecord
  validates :dream_list, presence: true
  validates :cost, format: { with: /\A[0-9]+\z/, message: 'は半角数値を使用してください' }, allow_blank: true
  
  belongs_to :user
end
