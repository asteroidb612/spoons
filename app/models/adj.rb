class Adj < ActiveRecord::Base
  attr_accessible :word, :used

  ### VALIDATIONS ###
  validates :word, :format => /\A[a-z]+\z/

  ### ACTIONS ###
  def to_s
    self.word
  end

end
