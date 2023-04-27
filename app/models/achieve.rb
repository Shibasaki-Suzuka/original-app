class Achieve < ApplicationRecord
  validates :success_day, presence: true

  belongs_to :dream
end
