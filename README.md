# Treasure Hunt

## Security
1. Encapsulation
> `@treasure_map` is a `Data.define()` struct

Once the Game class is instantiated, the winning coordinates cannot be viewed or mutated. Game instance methods only have the ability to check the winning coordinates of the treasure map against an Array of guess coordinates.

## Game Logic





## Steps
### Install Tailwind
[gorails - install tailwind css](https://gorails.com/episodes/adding-tailwindcss-to-rails)
> [tailwindcss-rails gem](https://github.com/rails/tailwindcss-rails)

> $ `rails new treasure_hunt --database=postgresql --css tailwind`
> 
> $ `cd treasure_hunt`
> 
> then, as per tailwind-rails docs
> 
> 
> 1. Run `./bin/bundle add tailwindcss-rails`
> 2. Run `./bin/rails tailwindcss:install`
> 
> 
> now, to run the rails server, we will no longer use `rails server`
> 
> instead, we start thru foreman with:
> 
> `bin/dev`
> 
> ...foreman not found, need to 
> 
> [`gem install foreman`](https://stackoverflow.com/questions/75405582/bin-dev-8-exec-foreman-not-found)
> 
> **NOTE:** Ruby users should take care not to install foreman in their project's Gemfile. See this [foreman wiki article](https://github.com/ddollar/foreman/wiki/Don%27t-Bundle-Foreman) for more details.



### Build the GameController
>`bin/rails generate controller Games start move`
>
>```
>   create  app/controllers/games_controller.rb
>    route  get 'games/start'
>           get 'games/move'
>   invoke  tailwindcss
>   create    app/views/games
>   create    app/views/games/start.html.erb
>   create    app/views/games/move.html.erb
>   invoke  test_unit
>   create    test/controllers/games_controller_test.rb
>   invoke  helper
>   create    app/helpers/games_helper.rb
>   invoke    test_unit
>```