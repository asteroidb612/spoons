class SpoonMailer < ActionMailer::Base
  default from: "RJ Spoon Wars Admin <mailer@spoons.stratosphe.re>"


  def game_open_email(player)
    @player = player
    @url = 'spoons.stratosphe.re'
    mail(to: player.email, subject: "RJ Spoon Wars")
  end

  def tag_confirm_email(player, tag)
    @player = player
    @tag = tag
    mail(to: player.email, subject: "RJ Spoon Wars -- Tag Confirmation")
  end

  def mobile_alert(player)
    @player = player
    mail(to: player.email, subject: "RJ Spoon Wars -- Mobile Devices")
  end

end
