class AndroidgamesController < ApplicationController
  before_action :set_androidgame, only: [:show, :edit, :update, :destroy]

  # GET /Androidgames
  # GET /Androidgames.json
  def index
    @androidgames = Androidgame.all
  end

  # GET /Androidgames/1
  # GET /Androidgames/1.json
  def show
    @androidgame = Androidgame.find_by_title_slug(params[:titleSlug])
  end

  # GET /Androidgames/new
  def new
    @androidgame = Androidgame.new
  end

  # GET /Androidgames/1/edit
  def edit
  end

  # POST /Androidgames
  # POST /Androidgames.json
  def create
    @androidgame = Androidgame.new(androidgame_params)

    respond_to do |format|
      if @androidgame.save
        format.html { redirect_to @androidgame, notice: 'Androidgame was successfully created.' }
        format.json { render :show, status: :created, location: @androidgame }
      else
        format.html { render :new }
        format.json { render json: @androidgame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Androidgames/1
  # PATCH/PUT /Androidgames/1.json
  def update
    respond_to do |format|
      if @androidgame.update(androidgame_params)
        format.html { redirect_to @androidgame, notice: 'Androidgame was successfully updated.' }
        format.json { render :show, status: :ok, location: @androidgame }
      else
        format.html { render :edit }
        format.json { render json: @androidgame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Androidgames/1
  # DELETE /Androidgames/1.json
  def destroy
    @androidgame.destroy
    respond_to do |format|
      format.html { redirect_to androidgames_url, notice: 'Androidgame was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_androidgame
      @androidgame = Androidgame.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def androidgame_params
      params[:Androidgame]
    end
end
