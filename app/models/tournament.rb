class Tournament < ActiveRecord::Base
  attr_accessible :name
  has_many :rounds

  def games
    self.rounds.collect{|r| r.games}.flatten(1)
  end

  def players
    self.games.collect {|g| g.players}.flatten(1)
  end

  def tags
    self.players.collect {|p| p.tags}.flatten(1)
  end

end
