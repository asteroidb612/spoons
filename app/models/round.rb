class Round < ActiveRecord::Base
  has_many :games
  attr_accessible :start_at, :end_at
  belongs_to :tournament

  def players
    this.games.collect {|g| g.players}.flatten(1)
  end

  def tags
    this.players.collect {|p| p.tags}.flatten(1)
  end

end
