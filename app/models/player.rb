class Player < ActiveRecord::Base
  attr_accessible :name, :password, :secret, :tagged, :tags, :year
  serialize :tags
  has_one :target
  belongs_to :game
end
