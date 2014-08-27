json.array!(@cards) do |card|
  json.extract! card, :id, :name, :remaining_hour, :own_player
  json.url card_url(card, format: :json)
end
