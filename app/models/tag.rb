class Tag < ActiveRecord::Base
  belongs_to :tagger, Player
  has_one :tagged, Player
  attr_accessible :timestamp
end
