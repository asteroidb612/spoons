class Player < ActiveRecord::Base
  attr_accessible :email, :name, :password, :secret, :year, :tagged
  # Array of players tagged
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true
  validates :year, presence: true

  # Oops
  # validates :photo, presence: true

  belongs_to :target, class_name: Player
  belongs_to :hunter, class_name: Player
  has_many :tags, class_name: Tag, foreign_key: "tagger_id"
  belongs_to :game

  has_attached_file :photo
  attr_protected :photo_file_name, :photo_content_type, :photo_size

  def active
    Player.where(tagged: false)
  end

  def inactive
    Player.where(tagged: true)
  end

  def self.authenticate(email, pass)
    (x = where(password: pass, email: email.downcase).first).nil? ? 0 : x.id
  end

  def pick_secret!
    wc = Word.count
    # ac = self.game.players.count
    
    while self.secret.nil?
      c = Adj.random.to_s + Word.random.to_s

      # Find other players in our game with our secret
      next if Player.where(:secret => c).count > 0
      self.secret = c
    end
    self.save!
    self.secret
  end

  # validates :photo_file_name, presence: true
  # validates :photo_content_type, presence: true
  # validates :photo_size, presence: true

end
