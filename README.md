# Treasure Hunt Game

## Walk Through Video
[![game walk-thru zight video](https://store-images.s-microsoft.com/image/apps.33692.e848c375-c3bc-4a4b-a89f-1b575f1b00e6.45c01bd1-7a66-41a6-a648-efa6c70f50aa.ce887cfb-8305-40be-8d66-0194518d92b9.png)](https://share.zight.com/ApuPmQZW)


## Security
1. Active Record Encryption
> Implemented [Active Record `encrypts`](https://guides.rubyonrails.org/active_record_encryption.html)
>> Encrypted values everywhere show up on server logs as `[FILTERED]`. If this was not the case, an attacker could parse an append-only log and cheat. 
>

> Sensitive values show up as `[FILTERED]`
>
![`filtered`](./encrypted_game_parameters.png)


>> Also, the use of `Dotenv` allows for a `.env` file to provide `ENV` variables in the `TreasureHunt::Application` file. This initialized the encrypted keys that provide the machinery for ActiveRecord to safely persist encrypted values in a data store/database.



2. Class Encapsulation
> In addition to the tools that ActiveRecord provides with Model encapsulation, the `Move` class sets a distinction between `public` api methods and those that are only accessible to the class. This ensures that the state of the `Move` and `Game` classes are tightly controlled by the instantiated objects.
>

3. Devise for Authentication
> [Devise](https://github.com/heartcombo/devise) is a Ruby gem that provides reasonable and safe authentication machinery.
> 

## Game Logic
The game board consists of a multi-dimensional Ruby array where a randomly generated treasure plot is set on.  Once set, this ploy location is encrypted and the player needs to take guesses for North(_- negative_)/South(_+ positive_), East(_- negative_)/West(_+ positive_) move pairs. Each unit represents 100 meters.  Given more time, I would improve this interface but for a first pass, the primitive controls serve their purpose to play the game.
