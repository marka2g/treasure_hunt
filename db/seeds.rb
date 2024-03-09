# run with $rails db:seed
# Example:
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[
  ["blah@example.com", 100], 
  ["meh@example.com", 200], 
  ["foo@example.com", 300], 
  ["bar@example.com", 400], 
  ["hunter@example.com", nil]
].each do |email, score|
  user = User.where(email: email).first_or_initialize

  # update! here will create user without create() which will cause errors
  user.update!(
    password: "password",
    password_confirmation: "password"
  )

  if score
    Game.create(email: email, board_size: 20, winning_distance: score)
  end
end