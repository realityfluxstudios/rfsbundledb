class DrmFreeGamesController < ApplicationController
  before_action :set_drmfreegame, only: [:show, :edit, :destroy]

  # GET /Drmfreegames
  # GET /Drmfreegames.json
  def index
    @drmfreegames = DrmFreeGame.all
  end

  # GET /Drmfreegames/1
  # GET /Drmfreegames/1.json
  def show
  end

  # GET /Drmfreegames/new
  def new
    @drmfreegames = DrmFreeGame.new
  end

  # GET /Drmfreegames/1/edit
  def edit
  end

  # POST /Drmfreegames
  # POST /Drmfreegames.json
  def create
    @drmfreegames = DrmFreeGame.new(drmfreegame_params)

    respond_to do |format|
      if @drmfreegames.save
        format.html { redirect_to @drmfreegames, notice: 'Drmfreegame was successfully created.' }
        format.json { render :show, status: :created, location: @drmfreegames }
      else
        format.html { render :new }
        format.json { render json: @drmfreegames.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Drmfreegames/1
  # PATCH/PUT /Drmfreegames/1.json
  # def update
  #   respond_to do |format|
  #     if @drmfreegames.update(Drmfree_params)
  #       format.html { redirect_to @drmfreegames, notice: 'Drmfree was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @drmfreegames }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @drmfreegames.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /Drmfreegames/1
  # DELETE /Drmfreegames/1.json
  def destroy
    @drmfreegames.destroy :id
    respond_to do |format|
      format.html { redirect_to drm_free_game_url, notice: 'DRM Free Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drmfreegame
      @drmfreegames = DrmFreeGames.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drmfreegame_params
      params[:DrmFreeGames]
    end
end
