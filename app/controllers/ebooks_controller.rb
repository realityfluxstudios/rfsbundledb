class EbooksController < ApplicationController
  before_action :set_ebook, only: [:show, :edit, :destroy]

  # GET /ebooks
  # GET /ebooks.json
  def index
    @ebooks = Ebook.all
  end

  # GET /ebooks/1
  # GET /ebooks/1.json
  def show
  end

  # GET /ebooks/new
  def new
    @ebooks = Ebook.new
  end

  # GET /ebooks/1/edit
  def edit
  end

  # POST /ebooks
  # POST /ebooks.json
  def create
    @ebooks = Ebook.new(drmfreegame_params)

    respond_to do |format|
      if @ebooks.save
        format.html { redirect_to @ebooks, notice: 'Ebook was successfully created.' }
        format.json { render :show, status: :created, location: @ebooks }
      else
        format.html { render :new }
        format.json { render json: @ebooks.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ebooks/1
  # DELETE /ebooks/1.json
  def destroy
    @ebooks.destroy :id
    respond_to do |format|
      format.html { redirect_to ebooks_url, notice: 'Ebook was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_ebook
    @ebooks = Ebook.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ebook_params
    params[:ebook]
  end
end
