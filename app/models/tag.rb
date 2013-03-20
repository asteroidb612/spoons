class Tag < ActiveRecord::Base
  attr_accessible :timestamp, :tagger_id, :tagged_id
  
  def tagger
    Player.where(id: self.tagger_id).first
  end

  def tagged
    Player.where(id: self.tagged_id).first
  end

  def self.after(time)
    Tag.all.collect {|t| t if t.timestamp > time}.delete_if {|x| x.nil?}
  end

  def to_s
    "#{tagger.name} tagged #{tagged.name} at #{timestamp.in_time_zone('America/Denver').to_formatted_s(:short)}"
  end
end
