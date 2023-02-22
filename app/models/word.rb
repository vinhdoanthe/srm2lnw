class Word < ApplicationRecord

  def today_words
    # Get list of words should be learned today
    Word.where(created_at: Time.zone.now.all_day)
  end

end
