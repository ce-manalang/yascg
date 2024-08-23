class Card < ApplicationRecord
  include CableReady::Broadcaster
  belongs_to :game
  after_create do
    # cable_ready["cards"]
    #   .console_log(message: "Welcome to the site!")
    #   .broadcast
    cable_ready["cards"].insert_adjacent_html(
      selector: "#cards",
      position: "afterbegin",
      html: "<span>Hello World</span>"
    )
  end
  # cable_ready['hello_quotes'].insert_adjacent_html(
  #     selector: '#quotes_list',
  #     position: 'afterBegin',
  #     html: render_to_string(partial: 'quote', locals: {quote: quote})
  #   )
  # cable_ready.broadcast
end