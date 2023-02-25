class WordsController < ApplicationController

  # Include Pagy for pagination
  include Pagy::Backend

  # Include FlashCardBuilder
  # include Builders::FlashCardBuilder

  before_action :set_word, only: %i[ show edit update destroy flash_card ]

  # Get /today or /today.json
  # Get today's words to learn
  def today_words
    @words = Word.today_words
  end

  def flash_card
    @word, @random_words = FlashCardBuilder.build(@word)
  end

  # GET /words or /words.json
  def index
    @pagy, @words = pagy(Word.where(:user => current_user).order(:created_at => :desc))
  end

  # GET /words/1 or /words/1.json
  def show
  end

  # GET /words/new
  def new
    @word = Word.new
  end

  # GET /words/1/edit
  def edit
  end

  # POST /words or /words.json
  def create
    @word = Word.new(word_params)
    @word.user = current_user

    respond_to do |format|
      if @word.save
        format.html { redirect_to word_url(@word), notice: "Word was successfully created." }
        format.json { render :show, status: :created, location: @word }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /words/1 or /words/1.json
  def update
    @word.user = current_user
    respond_to do |format|
      if @word.update(word_params)
        format.html { redirect_to word_url(@word), notice: "Word was successfully updated." }
        format.json { render :show, status: :ok, location: @word }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1 or /words/1.json
  def destroy
    @word.destroy

    respond_to do |format|
      format.html { redirect_to words_url, notice: "Word was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def word_params
      params.require(:word).permit(:word, :pronunciation, :meaning, :level_of_difficult)
    end
end
