class Card < ActiveRecord::Base
  validates :name, :remaining_hour, :own_player, presence: true
  validates :remaining_hour, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 720}

  def calc_remaining_hour_from_now
    # 更新時と残り時間から、現在からの残り時間を算出する（結果は四捨五入）
    {:updated_at => updated_at, :remaining_hour => remaining_hour}
    (((updated_at + remaining_hour * 60 * 60) - Time.now) / 60 / 60).round
  end

  def display_style
    if self.calc_remaining_hour_from_now <= 0
      "background-color: #9e9e9e;"
    elsif self.calc_remaining_hour_from_now <= 24
      "background-color: #ff7d7d;"
    end
  end

  def display_remaining_hour
    if self.calc_remaining_hour_from_now <= 0
      "期限切れ"
    else
      self.calc_remaining_hour_from_now.to_s + " 時間"
    end
  end

  def self.sort_by_remaining_hour(cards)
    @cards = cards.sort { |x, y| x.calc_remaining_hour_from_now <=> y.calc_remaining_hour_from_now }
  end
end
