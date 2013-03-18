class Game < ActiveRecord::Base
  has_many :players
  belongs_to :round

  def tags
    this.players.collect {|p| p.tags}.flatten(1)
  end

  def assign_targets
    min = 0
    max = players.count - 1
    (min..max-1).each do |i|
      players[i].target = players[i+1] if players[i].target_id == nil
      players[i].save!
    end
    players[max].target = players[0] if players[max].target_id == nil
    players[max].save!
  end
  
  def most_tags
    ret = nil
    players.each do |p|
      if ret == nil
        ret = p
      elsif p.tags.count > ret.tags.count
        ret = p
      end
    end
    return ret
  end
  
  def survivor
    if players.count == 1
      return players.first.name
    elsif players.count == 2
      return "Heated battle between #{players.first.name} and #{players.last.name}!"
    else
      return "Game not yet over."
    end
  end
  
end
