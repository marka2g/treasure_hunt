



<!-- never used -->
# Treasure Hunt
## Security
1. Encapsulation
> used [Active Record `encrypts`](https://guides.rubyonrails.org/active_record_encryption.html)
>> discus `.env` 
>> 
> ~~`@treasure_map` is a `Data.define()` struct~~

Once the Game class is instantiated, the winning coordinates cannot be viewed or mutated. Game instance methods only have the ability to check the winning coordinates of the treasure map against an Array of guess coordinates.

<!-- never used -->


<%= f.submit "Log In", class: "bg-neutral-200 px-4 py-2 rounded" %>

<!-- to style buttons, we first need to copy the devise views with -->
$ `rails g devise:views`
```
  invoke  Devise::Generators::SharedViewsGenerator
  create    app/views/devise/shared
  create    app/views/devise/shared/_error_messages.html.erb
  create    app/views/devise/shared/_links.html.erb
  invoke  form_for
  create    app/views/devise/confirmations
  create    app/views/devise/confirmations/new.html.erb
  create    app/views/devise/passwords
  create    app/views/devise/passwords/edit.html.erb
  create    app/views/devise/passwords/new.html.erb
  create    app/views/devise/registrations
  create    app/views/devise/registrations/edit.html.erb
  create    app/views/devise/registrations/new.html.erb
  create    app/views/devise/sessions
  create    app/views/devise/sessions/new.html.erb
  create    app/views/devise/unlocks
  create    app/views/devise/unlocks/new.html.erb
  invoke  erb
  create    app/views/devise/mailer
  create    app/views/devise/mailer/confirmation_instructions.html.erb
  create    app/views/devise/mailer/email_changed.html.erb
  create    app/views/devise/mailer/password_change.html.erb
  create    app/views/devise/mailer/reset_password_instructions.html.erb
  create    app/views/devise/mailer/unlock_instructions.html.erb
```



`rails generate model Game email:string board_size:integer history:string`

add array to migration
> `t.string :history, :text, array: true, default: []`
>
> use it
> 
>>```ruby
>>irb> game = Game.create(email: "player@example.com", board_size: 20, history: [[2, 2],[0, 0]])
>>irb> game.history
>>```



# Treasure Hunt Notes

## Guidance
1. Followed [gorails](https://gorails.com/series/build-a-blog-with-rails-7) for various Rails 7 installs
>>
>> [gorails source](https://github.com/gorails-screencasts/learning-path-blog) 
2. Viewed [Deanout action chess](https://github.com/Deanout/action_chess/) for inspiration
3. Watched [Deanout rails engine](https://www.youtube.com/watch?v=7AVb4mJuIWA) for Engine example


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

### Generate a test model - `blog`

> $ `rails generate` - shows options
> 
> $ `rails generate model BlogPost title:string body:text`
>>```
>>invoke  active_record
>>create    db/migrate/20240308173724_create_blog_posts.rb
>>create    app/models/blog_post.rb
>>invoke    test_unit
>>create      test/models/blog_post_test.rb
>>create      test/fixtures/blog_posts.yml
>>>```
>
> $ `rails db:migrate`
>
> $ `rails c`
>>
>> irb>`BlogPost.all`
>> 
>> irb>`BlogPost.create(title: "BlahBlog", body: "some blah text")`
>
> next, add `app/controllers/blog_posts_controller.rb`
>

> added `index` and `show` actions but then skpped to adding `devise`

### Devise
> $ `bundle add devise`
>
> [devise gem](https://github.com/heartcombo/devise)
>
> $ `rails g devise:install`
>
> $ `rails g devise User`
>>```
>>   invoke  active_record
>>   create    db/migrate/20240308183328_devise_create_users.rb
>>   create    app/models/user.rb
>>   invoke    test_unit
>>   create      test/models/user_test.rb
>>   create      test/fixtures/users.yml
>>   insert    app/models/user.rb
>>    route  devise_for :users
>>```
>
> $ `rails db:migrate`
>
>> now we can go to `/users/sign_up` 
>
> commented out `:registerable` because we only want to create users from the console
>>
>>```ruby
>># delete last user
>>irb> User.last.destroy
>>```
>
> then, add to db seeds
> 
>>```ruby
>>user = User.where(email: "hunter@example.com").first_or_initialize
>>user.update!(
>>  password: "password",
>>  password_confirmation: "password"
>>)
>>```
>>
>> $ `rails db:seed`


### Finish the rest of the BlogPost actions




### Virtual Attributes
https://gorails.com/episodes/virtual-attributes-and-rails-5-attribute-api



`rails generate model Game email:string board_size:integer history:string`


[rails guides - postgresql](https://guides.rubyonrails.org/active_record_postgresql.html)
[rails column types blog](https://dev.to/asyraf/rails-activerecord-data-types-32ip)
[old - rails column types](https://stackoverflow.com/questions/3260345/list-of-rails-model-types)




> $ `game = Game.create(email: "player@example.com", board_size: 20)`


[AR Encryption](https://guides.rubyonrails.org/active_record_encryption.html)


`bin/rails db:encryption:init`

```
Add this entry to the credentials of the target environment:

active_record_encryption:
  primary_key: ls0EEjiRD9U4Z3Sd1Fv2qEP5PYgwp3AI
  deterministic_key: j1CNxP8NZhomQeBEe7q4HVBIVrk9K3gl
  key_derivation_salt: 2hkhwund2HWDkNqExOWJy6Uwhb9fl4AU


# alternatively set ENV vars: 
config.active_record.encryption.primary_key = ENV['ACTIVE_RECORD_ENCRYPTION_PRIMARY_KEY']
config.active_record.encryption.deterministic_key = ENV['ACTIVE_RECORD_ENCRYPTION_DETERMINISTIC_KEY']
config.active_record.encryption.key_derivation_salt = ENV['ACTIVE_RECORD_ENCRYPTION_KEY_DERIVATION_SALT']


<!-- added to application.rb with .env | got-->
irb(main):002> ENV['ACTIVE_RECORD_ENCRYPTION_PRIMARY_KEY']
=> "ls0EEjiRD9U4Z3Sd1Fv2qEP5PYgwp3AI"
irb(main):003> ENV['ACTIVE_RECORD_ENCRYPTION_DETERMINISTIC_KEY']
=> "j1CNxP8NZhomQeBEe7q4HVBIVrk9K3gl"
irb(main):004> ENV['ACTIVE_RECORD_ENCRYPTION_KEY_DERIVATION_SALT']
=> "2hkhwund2HWDkNqExOWJy6Uwhb9fl4AU"

ok

```


what should be encrypted?

```ruby
size = 20
board = (1..size*size).each_slice(size).to_a

x, y = [rand(0..19), rand(0..19)]

# nope, not needed
# treasure_map = Treasure.new(board[x][y], [x, y])


def get_plot(coords)
  board[x][y]
end
```


<!-- 
  reset db 
  https://stackoverflow.com/questions/10301794/difference-between-rake-dbmigrate-dbreset-and-dbschemaload
-->
`rails db:migrate:reset`

<!-- does all of these -->
`rails db:reset`
`rails db:migrate`
`bin/rails db:seed`

<!-- reset db -->