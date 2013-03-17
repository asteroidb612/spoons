class SpoonMailer < ActionMailer::Base
  default from: "mailer@spoons.stratosphe.re"


  def game_open_email(player)
    @player = player
    @url = 'spoons.stratosphe.re'
    mail(to: player.email, subject: "RJ Spoon Wars")
  end

end
