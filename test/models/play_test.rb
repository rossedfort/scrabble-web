require 'test_helper'

class PlayTest < ActiveSupport::TestCase
  def test_it_is_valid_with_a_word
    assert Play.new(:word => "hi").valid?
  end

  def test_it_is_not_valid_with_an_empty_word
    refute Play.new(:word => "").valid?
  end

  def test_a_seven_letter_word_is_ok
    assert Play.new(:word => "popcorn").valid?
  end

  def test_an_eight_letter_word_is_too_long
    refute Play.new(:word => "pretzels").valid?
  end

  def test_it_scores_a_word
    play = Play.new(:word => "hello")
    assert_equal 8, play.score
  end

  def test_it_scores_a_double_word_score
    play = Play.new(:word => "hello")
    assert_equal 16, play.score(:word_multiplier => :double)
  end

  def test_it_scores_a_triple_word_score
    play = Play.new(:word => "hello")
    assert_equal 24, play.score(:word_multiplier => :triple)
  end

end
