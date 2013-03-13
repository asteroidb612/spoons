class Player < ActiveRecord::Base
  attr_accessible :email, :name, :password, :secret, :tagged, :tags, :year
  # Array of players tagged
  has_one :target, Player
  has_many :tags, Tag
  belongs_to :game

  has_attached_file :photo
  attr_protected :photo_file_name, :photo_content_type, :photo_size

end
