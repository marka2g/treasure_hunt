# Treasure Hunt Game

## Walk Through Video
[![<img src="zight_recording.png" width="180"/>]](https://share.zight.com/ApuPmQZW)

_NOTE: The treasure coordinated that appear on the log have been removed and have only been placed there to test the UI._

## Security
1. Active Record Encryption
> Implemented [Active Record `encrypts`](https://guides.rubyonrails.org/active_record_encryption.html)
>> Encrypted values everywhere show up on server logs as `[FILTERED]`. If this was not the case, an attacker could parse an append-only log and cheat. 
>

>
![`filtered`](./encrypted_game_parameters.png)


>> Also, the use of `Dotenv` allows for an `.env` file to provide `ENV` variables in the `TreasureHunt::Application` file. These environment variables are initialized the encrypted keys are used by ActiveRecord to safely persist values in a data store/database.



1. Class Encapsulation
> In addition to the tools that ActiveRecord provides with Model encapsulation, the `Move` class sets a distinction between `public` api methods and those that are only accessible to the class. This ensures that the state of the `Move` and `Game` classes are tightly controlled by the instantiated objects.
>

1. Devise for Authentication
> [Devise](https://github.com/heartcombo/devise) is a Ruby gem that provides reasonable and safe authentication machinery.
> 

## Game Logic
The game board consists of a multi-dimensional Ruby array where a randomly generated treasure plot is set on.  Once set, this plot location is encrypted and the player takes guesses for North(_- negative_)/South(_+ positive_), East(_- negative_)/West(_+ positive_) move pairs. Each unit represents 100 meters. Given more time, I would improve this interface but for a first pass, the primitive controls serve their purpose to play the game.
