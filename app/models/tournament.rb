class Tournament < ActiveRecord::Base
  has_many :rounds

  def games
    this.rounds.collect{|r| r.games}.flatten(1)
  end

  def players
    this.games.collect {|g| g.players}.flatten(1)
  end

  def tags
    this.players.collect {|p| p.tags}.flatten(1)
  end

end
