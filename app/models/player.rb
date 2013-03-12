class Player < ActiveRecord::Base
  attr_accessible :email, :name, :password, :secret, :tagged, :tags, :year
  # Array of players tagged
  has_one :target, Player
  has_many :tags
  belongs_to :game
end
