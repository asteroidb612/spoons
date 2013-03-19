class Game < ActiveRecord::Base
  has_many :players
  belongs_to :round

  def tags
    this.players.collect {|p| p.tags}.flatten(1)
  end

  def assign_targets
    min = 0
    max = players.count - 1
    plist = players.shuffle
    10.times do
      plist.shuffle!
    end
    (min..max-1).each do |i|
      plist[i].target = plist[i+1] if plist[i].target_id == nil
      plist[i].save!
    end
    plist[max].target = plist[0] if plist[max].target_id == nil
    plist[max].save!
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
