class FlashCardBuilder
  # This class is responsible for building flash cards from a word.
  def self.build(word)
    # find random words in database
    @random_words = Word.random_words(word)
    return word, @random_words
  end
end
