class Player < ActiveRecord::Base
  attr_accessible :email, :name, :password, :secret, :year, :tagged
  # Array of players tagged
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true
  validates :year, presence: true
  validates :photo, presence: true

  has_one :target, class_name: Player
  has_many :tags, class_name: Tag
  belongs_to :game

  has_attached_file :photo
  attr_protected :photo_file_name, :photo_content_type, :photo_size

  # validates :photo_file_name, presence: true
  # validates :photo_content_type, presence: true
  # validates :photo_size, presence: true

end
