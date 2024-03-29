class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :dreams
  has_many :likes
  
  # フォローする
  has_many :active_friends, class_name: "Friend", foreign_key: :following_id
  has_many :followings, through: :active_friends, source: :follower
  # フォローされる
  has_many :passive_friends, class_name: "Friend", foreign_key: :follower_id
  has_many :followers, through: :passive_friends, source: :following

  def followed_by?(user)
    follower =  passive_friends.find_by(following_id: user.id)
    return follower.present?
  end

  def following_by?(user)
    follower =  active_friends.find_by(follower_id: user.id)
    return follower.present?
  end
  
  with_options presence: true do
    validates :nickname
    validates :last_name,  format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :last_name_hiragana, format: { with: /\A[ぁ-んー－]+\z/, message: 'はひらがなで入力して下さい。' }
    validates :first_name_hiragana, format: { with: /\A[ぁ-んー－]+\z/, message: 'はひらがなで入力して下さい。' }
    validates :birthday
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります' }, allow_blank: true, on: :update
  validates :password, format: { with: VALID_PASSWORD_REGEX }, on: :create
  
  # パスワードなしでユーザー情報を更新する
  def update_without_current_password(params, *options)
    params.delete(:current_password)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  mount_uploader :avatar, AvatarUploader
end
