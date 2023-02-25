class LearningAttemptController < ApplicationController

  before_action :set_attempt, only: [:show, :create]

  def show

  end

  def new
    @learning_attempt = LearningAttempt.new
  end

  def index
    @learning_attempts = LearningAttempt.all
  end

  def create
    @learning_attempt = LearningAttempt.new(learning_attempt_params)
    if @learning_attempt.save
      redirect_to learning_attempt_path(@learning_attempt)
    else
      render :new
    end
  end

  private

  def set_attempt
    @learning_attempt = LearningAttempt.find(params[:id])
  end
end
