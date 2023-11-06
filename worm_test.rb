require 'minitest/autorun'
require_relative 'worm'  # Adjust the path as needed

class WormTest < Minitest::Test
  def setup
    @worm = Worm.new(5, 5, 5)
  end

  def test_initial_position
    assert_equal 5, @worm.x
    assert_equal 5, @worm.y
  end

  def test_initial_length
    assert_equal 5, @worm.length
  end

  def test_move_right
    @worm.direction = :right
    @worm.move
    assert_equal 6, @worm.x
    assert_equal 5, @worm.y
  end

  # Add more test cases for movement and food collection as needed
end