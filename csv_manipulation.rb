require 'pry'

class SwiftStats
  attr_reader :text, :lyrics

  def initialize(file_path)
    @text =""
    @lyrics = {}
    File.open(file_path).readlines.each do |line|
      @text << line
    end
  end


   def sanitizer
     san_text = @text.gsub!(/[,.:!?()""]/, ' ')
     san_text = san_text.split
     san_text = san_text.map { |word| word.upcase }
     @text = san_text
   end

  def collect_unique_words
    @text.each do |word|
      if @lyrics.keys.include?(word)
        @lyrics[word] += 1
      else
        @lyrics[word] = 1
      end
    end
    lyrics
  end

  def unique_words
    @lyrics.keys
  end

  def unique_words_count
    unique_words.count
  end

  def lyrics_by_frequency
    @lyrics.sort_by {|k, v| v }.reverse.to_h
  end

  def stats
    sanitizer
    collect_unique_words
    unique_words_count
  end

end

ss = SwiftStats.new("lyrics.txt")
puts ss.stats
