class GamesMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.games_mailer.winner.subject
  #
  def winner(game)
    @game = game

    mail to: "treasure-hunt@example.com", to: "You Found the Treasure!"
  end
end
