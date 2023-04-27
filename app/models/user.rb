class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :last_name,  format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :last_name_hiragana, format: { with: /\A[ぁ-んー－]+\z/, message: 'はひらがなで入力して下さい。' }
    validates :first_name_hiragana, format: { with: /\A[ぁ-んー－]+\z/, message: 'はひらがなで入力して下さい。' }
    validates :birthday
  end

  has_many :dreams
  has_many :achieves
end
