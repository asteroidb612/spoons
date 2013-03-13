class Player < ActiveRecord::Base
  attr_accessible :name, :password, :secret, :tagged, :tags, :year

  serialize :tags

  has_one :target
  belongs_to :game

  has_attached_file :photo
  attr_protected :photo_file_name, :photo_content_type, :photo_size

end
