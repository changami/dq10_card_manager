class Team < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: {maximum: 40}
  has_secure_password

  has_many :line_cards, dependent: :destroy
end
