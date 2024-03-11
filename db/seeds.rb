# to use, run: rails db:seed
# to start fresh, run: `rails db:migrate:reset` and then `rails db:seed`
test_player = User.create(email: "test-hunter@example.com")
test_player.update!(
  password: "password",
  password_confirmation: "password"
)

# pagination testing
50.times do |i|
  user = User.where(email: "hunter-#{i+1}@example.com").first_or_initialize
  user.update!(
    password: "password",
    password_confirmation: "password"
  )
  game = Game.create(user: user, board_size: 20)
  game.moves.create!({x: 1, y: 1})
  game.update!(winning_distance: %w( 0 100 200 300 400 500 600 700 800 900).sample.to_i)

  puts "User with email: #{user.email} created"
end