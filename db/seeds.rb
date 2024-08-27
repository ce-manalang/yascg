# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

all_cards = JSON.parse(File.read(Rails.root.join('db/cards.json')))
all_cards.each do |card|
  a = Card.new(
    game: Game.first,
    level: card['level'],
    label: card['label'],
    wildcard: card['reminder'],
    reminder: card['reminder'],
    content: card['content']
  )
  if a.save
    puts "[CREATE]: Card##{a.id}"
  else
    puts "[ERRORS]: #{a.errors.full_messages}"
  end
end