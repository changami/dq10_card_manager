json.array!(@line_cards) do |line_card|
  json.extract! line_card, :id, :card_id, :team_id
  json.url line_card_url(line_card, format: :json)
end
