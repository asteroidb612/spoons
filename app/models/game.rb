class Game < ActiveRecord::Base
  has_many :players
  belongs_to :round

  def tags
    this.players.collect {|p| p.tags}.flatten(1)
  end

end
