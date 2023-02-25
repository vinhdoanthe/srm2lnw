class Word < ApplicationRecord

  belongs_to :user

  has_many :learning_attempts


  validates :word, presence: true
  validates :meaning, presence: true

  # Other filters (to be defined in the future)
  # has_many :learning_attemps_true, -> { where(learning_attempts: {proficient: true}) }, through: :learning_attempts, source: :word
  # ...

  def self.today_words
    # Get list of words should be learned today
    Word.where(created_at: Time.zone.now.all_day)
  end

  def pronucation_link
    ''
  end

  def sample_sentence
    ''
  end

  def self.random_words(word)
    # Get 3 random words
    random_words = self.where.not(id: word.id).sample(3)
    random_words << word
    random_words.shuffle
  end

end
