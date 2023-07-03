class Achieve < ApplicationRecord
  with_options presence: true do
    validates :success_day
    validates :comment, allow_blank: true
    validates :image, allow_blank: true
  end

  belongs_to :dream
  belongs_to :user
  has_one_attached :image
end
