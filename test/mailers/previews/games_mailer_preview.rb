# Preview all emails at http://localhost:3000/rails/mailers/games_mailer
class GamesMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/games_mailer/winner
  def winner
    GamesMailer.winner Game.last
  end

end
