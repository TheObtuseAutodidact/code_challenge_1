require 'minitest'
require 'minitest/autorun'
require '/Users/lenny/Desktop/code_challenge_1/csv_manpulation.rb'

class SwiftStatsTest < Minitest::Test
  def sample_text
    "He said the way my blue eyes shined
    Put those Georgia stars to shame that night
    I said: 'That's a lie."
  end

  def test_it_exists
    assert SwiftStats.new(sample_text)
  end

  def test_it_sanitizes_text
    ss = SwiftStats.new(sample_text)

    result = ss.sanitizer
    expected = ["HE", "SAID", "THE", "WAY", "MY", "BLUE",
      "EYES", "SHINED", "PUT", "THOSE", "GEORGIA", "STARS",
      "TO", "SHAME", "THAT", "NIGHT", "I", "SAID", "'THAT'S",
      "A", "LIE"]

    assert_equal expected, result
  end

  def test_it_collects_unique_words
    ss = SwiftStats.new(sample_text)
    ss.sanitizer
    result = ss.collect_unique_words
    expected = {"HE"=>1, "SAID"=>2, "THE"=>1, "WAY"=>1, "MY"=>1,
      "BLUE"=>1, "EYES"=>1, "SHINED"=>1, "PUT"=>1, "THOSE"=>1,
      "GEORGIA"=>1, "STARS"=>1, "TO"=>1, "SHAME"=>1, "THAT"=>1,
      "NIGHT"=>1, "I"=>1, "'THAT'S"=>1, "A"=>1, "LIE"=>1}

    assert_equal expected, result
  end

  def test_it_returns_unique_words
    ss = SwiftStats.new(sample_text)
    ss.sanitizer
    ss.collect_unique_words
    result = ss.unique_words
    expected = ["HE", "SAID", "THE", "WAY", "MY", "BLUE", "EYES",
      "SHINED", "PUT", "THOSE", "GEORGIA", "STARS", "TO", "SHAME",
      "THAT", "NIGHT", "I", "'THAT'S", "A", "LIE"]

    assert_equal expected, result
  end

  def test_it_returns_a_count_of_unique_words
    ss = SwiftStats.new(sample_text)
    ss.sanitizer
    ss.collect_unique_words
    result = ss.unique_words_count
    expected = 20

    assert_equal expected, result
  end

  def test_it_sorts_words_by_frequency
    ss = SwiftStats.new(sample_text)
    ss.sanitizer

    ss.collect_unique_words
    result = ss.lyrics_by_frequency
    expected = {"SAID"=>2, "GEORGIA"=>1, "'THAT'S"=>1, "I"=>1,
      "NIGHT"=>1, "THAT"=>1, "SHAME"=>1, "TO"=>1, "STARS"=>1, "A"=>1,
      "THOSE"=>1, "PUT"=>1, "SHINED"=>1, "EYES"=>1, "BLUE"=>1, "MY"=>1,
      "WAY"=>1, "THE"=>1, "LIE"=>1, "HE"=>1}

    assert_equal expected, result
  end

end
