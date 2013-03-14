class Player < ActiveRecord::Base
  attr_accessible :email, :name, :password, :secret, :year, :tagged
  # Array of players tagged
  has_one :target, class_name: Player
  has_many :tags, class_name: Tag
  belongs_to :game

  has_attached_file :photo
  attr_protected :photo_file_name, :photo_content_type, :photo_size

end
