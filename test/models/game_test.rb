require "test_helper"

class GameTest < ActiveSupport::TestCase

  test "loosing move" do
    game = games(:one)
    Game.stub :random_coords, [10, 5] do
      assert_equal [false, "🙅🏽‍♂️ Sorry, you are 1000 meters away. Try again. 🙅🏽‍♂️"], game.move([0, 5])
    end
  end

  test "winning move" do
    game = games(:two)
    Game.stub :random_coords, [5, 5] do
      assert_equal [true, "💎 The treasure is 0 meters away - you win! 💎"], game.move([5, 5])
    end
  end

  test "move north test" do
    game = games(:two)
    Game.stub :random_coords, [10, 10] do
      game.move([15, 5])
      assert_equal [true, "💎 The treasure is 0 meters away - you win! 💎"], game.move([-5, 10]))
    end
  end

  test "move east test" do
    game = games(:two)
    Game.stub :random_coords, [10, 10] do
      game.move([5, 15])
      assert_equal [true, "💎 The treasure is 0 meters away - you win! 💎"], game.move([10, -5]))
    end
  end
end
