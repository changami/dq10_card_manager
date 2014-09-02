json.array!(@teams) do |team|
  json.extract! team, :id, :name, :password_digest
  json.url team_url(team, format: :json)
end
