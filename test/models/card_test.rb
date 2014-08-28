require 'test_helper'

class CardTest < ActiveSupport::TestCase
  fixtures :cards

  test "card attributes must not be empty" do
    card = Card.new
    assert card.invalid?
    assert card.errors[:name].any?
    assert card.errors[:remaining_hour].any?
    assert card.errors[:own_player].any?
  end

  test "card remaining_hour must be positive" do
    card = Card.new(
        name: "Test Card",
        own_player: "chan_gami"
    )

    card.remaining_hour = -1
    assert card.invalid?
    assert_equal "must be greater than or equal to 1",
                 card.errors[:remaining_hour].join('; ')

    card.remaining_hour = 0
    assert card.invalid?
    assert_equal "must be greater than or equal to 1",
                 card.errors[:remaining_hour].join('; ')

    card.remaining_hour = 721
    assert card.invalid?
    assert_equal "must be less than or equal to 720",
                 card.errors[:remaining_hour].join('; ')

    card.remaining_hour = 1
    assert card.valid?

    card.remaining_hour = 720
    assert card.valid?
  end

  test "card can save a duplicate data" do
    card = Card.new(
        name: cards(:atlas).name,
        remaining_hour: cards(:atlas).remaining_hour,
        own_player: cards(:atlas).own_player
    )
    assert card.save
  end
end
