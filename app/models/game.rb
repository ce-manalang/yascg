class Game < ApplicationRecord
  include Hashid::Rails
  has_many :cards, dependent: :destroy
end