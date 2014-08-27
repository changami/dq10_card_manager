class Card < ActiveRecord::Base
  validates :name, :remaining_hour, :own_player, presence: true
  validates :remaining_hour, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 720}
end
