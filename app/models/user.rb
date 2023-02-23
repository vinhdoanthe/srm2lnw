class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :words
  has_many :learning_attempts

  # Other filters
  # has_many :proficient_words, -> { where(learning_attempts: {proficient: true}) }, through: :learning_attempts, source: :word
  # ...
  # has_many :learning_attempts_today, -> { where(learning_attempts: {created_at: Time.zone.now.all_day}) }, through: :learning_attempts, source: :word
  # ...
end
