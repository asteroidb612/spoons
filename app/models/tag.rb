class Tag < ActiveRecord::Base
  attr_accessible :timestamp, :tagger_id, :tagged_id
  
  def tagger
    Player.where(id: self.tagger_id).first
  end

  def tagged
    Player.where(id: self.tagged_id).first
  end

  def to_s
    "#{tagger.name} tagged #{tagged.name} at #{timestamp.in_time_zone('America/Denver').to_formatted_s(:long_ordinal)}"
  end
end
