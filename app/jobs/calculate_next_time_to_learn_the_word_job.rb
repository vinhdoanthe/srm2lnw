class CalculateNextTimeToLearnTheWordJob < ApplicationJob
  queue_as :word_scheduling

  def perform(word)
    puts "Performing job for word #{word.inspect}"
    if word.save
      puts "Word #{word.inspect} saved"
    else
      puts "Word #{word.inspect} not saved"
    end
    # Do something later
  end
end
