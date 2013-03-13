class Player < ActiveRecord::Base
  attr_accessible :email, :name, :password, :secret, :year
  # Array of players tagged
  has_one :target, class_name: Player
  has_many :tags
  belongs_to :game
end
