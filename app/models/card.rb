class Card < ApplicationRecord
  has_rich_text :content
  belongs_to :game
  has_many :messages, dependent: :destroy
  
  after_create do
    cable_ready["card"].console_log(message: "Welcome to the site!")
    cable_ready.broadcast
  end
  # cable_ready['hello_quotes'].insert_adjacent_html(
  #     selector: '#quotes_list',
  #     position: 'afterBegin',
  #     html: render_to_string(partial: 'quote', locals: {quote: quote})
  #   )
  # cable_ready.broadcast
end