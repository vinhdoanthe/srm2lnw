class CalculateNextTimeToLearnTheWordJob < ApplicationJob
  queue_as :default

  def perform(word)
    word.upcoming_learn_at = Time.zone.now + 3.hours

    puts "Performing job for word #{word.inspect}"
    if word.save
      puts "Word #{word.inspect} saved"
    else
      puts "Word #{word.inspect} not saved"
    end
    # Do something later
  end
end
