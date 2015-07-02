class ExtractWordsController < ApplicationController
  before_action :set_extract_word, only: [:show, :edit, :update, :destroy]

  # GET /extract_words
  # GET /extract_words.json
  def index
    @extract_words = ExtractWord.all
  end

  # GET /extract_words/1
  # GET /extract_words/1.json
  def show
  end

  # GET /extract_words/new
  def new
    @extract_word = ExtractWord.new
  end

  # GET /extract_words/1/edit
  def edit
  end

  # POST /extract_words
  # POST /extract_words.json
  def create
    @extract_word = ExtractWord.new(extract_word_params)

    respond_to do |format|
      if @extract_word.save
        format.html { redirect_to @extract_word, notice: 'Extract word was successfully created.' }
        format.json { render :show, status: :created, location: @extract_word }
      else
        format.html { render :new }
        format.json { render json: @extract_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /extract_words/1
  # PATCH/PUT /extract_words/1.json
  def update
    respond_to do |format|
      if @extract_word.update(extract_word_params)
        format.html { redirect_to @extract_word, notice: 'Extract word was successfully updated.' }
        format.json { render :show, status: :ok, location: @extract_word }
      else
        format.html { render :edit }
        format.json { render json: @extract_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /extract_words/1
  # DELETE /extract_words/1.json
  def destroy
    @extract_word.destroy
    respond_to do |format|
      format.html { redirect_to extract_words_url, notice: 'Extract word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extract_word
      @extract_word = ExtractWord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def extract_word_params
      params.require(:extract_word).permit(:word)
    end
end
