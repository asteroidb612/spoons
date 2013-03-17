class ApplicationController < ActionController::Base
  protect_from_forgery
  def player
    Player.find(session[:id])
  end
end
