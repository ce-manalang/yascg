# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Question.create(content: "What is your biggest fear?", category: "Personal")
Question.create(content: "What is your dream job?", category: "Career")
Question.create(content: "If you could have dinner with anyone, dead or alive, who would it be?", category: "Personal")