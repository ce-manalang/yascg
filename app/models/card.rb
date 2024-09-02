class Card < ApplicationRecord
  has_rich_text :content
  belongs_to :game
  has_many :messages, dependent: :destroy
end