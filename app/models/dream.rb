class Dream < ApplicationRecord
  validates :dream_list, null: false
  validates :cost, format: { with: /\A[0-9]+\z/, message: 'は半角数値を使用してください' }, allow_blank: true
  
  belongs_to :user
end
