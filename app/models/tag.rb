class Tag < ActiveRecord::Base
  belongs_to :tagger, class_name: Player
  has_one :tagged, class_name: Player
  attr_accessible :timestamp
end
