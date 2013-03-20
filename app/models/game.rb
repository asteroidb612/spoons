class Game < ActiveRecord::Base
  has_many :players
  belongs_to :round

  def tags
    players.collect {|p| p.tags}.flatten(1).sort {|a,b| a.timestamp <=> b.timestamp}
  end

  def assign_targets
    plist = players
    10.times do
      plist.shuffle!
    end
    min = 0
    max = players.count - 1
    (min..max-1).each do |i|
      plist[i].target = plist[i+1] if plist[i].target_id == nil
      plist[i].save!
    end
    plist[max].target = plist[0] if plist[max].target_id == nil
    plist[max].save!
    return
  end
  
  # def most_tags
  #   ret = nil
  #   players.each do |p|
  #     if ret == nil
  #       ret = p
  #     elsif p.tags.count > ret.tags.count
  #       ret = p
  #     end
  #   end
  #   return ret
  # end
  
  def most_tags
    plist = players.sort {|a, b| b.tags.count <=> a.tags.count }
    max = plist.first.tags.count
    high = plist.collect {|p| p if p.tags.count == max }.uniq.delete_if {|x| x == nil}
    str = ""
    high.each do |p|
      str = str + " #{p.name} (#{p.tags.count})"
    end
    str
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

  def tags_after(time)
    tags.collect {|t| t if t.timestamp > time}.delete_if {|x| x.nil?}
  end
  
end
