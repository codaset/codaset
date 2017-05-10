json.columns @columns do |column|
  json.state_name column[:state_name]
  json.state_display_name column[:state_display_name]
  json.card_count column[:card_count]
  json.cards column[:cards] do |card|
    json.call Card.new(card), :number, :title, :description
  end
end
