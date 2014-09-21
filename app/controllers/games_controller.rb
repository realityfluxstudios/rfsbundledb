class GamesController < ApplicationController
  before_action :set_game_by_slug, only: [:show, :edit, :destroy]
  before_action :set_game, only: :update

  # GET /games
  # GET /games.json
  def index
    @games = Game.all.sort_by { |title| }
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /check_steam_id/1.json
  def check_steam_id
    url = 'http://store.steampowered.com/api/appdetails?appids=' + params[:steam_id] + '&filters=basic'
    resp = Net::HTTP.get_response(URI.parse(url))
    game_info = ActiveSupport::JSON.decode(resp.body)

    if game_info[params[:steam_id]]['success']
      @game = Game.find_by_steam_id(params[:steam_id]) || Game.new
      if @game.id != nil
        @game.steam_id = params[:steam_id]
      end
    end

    respond_to do |format|
      if game_info[params[:steam_id]]['success']
        @game.title = params[:steam_id]['data']['name']
        format.json { render :show, status: :ok, location: @game }
      else
        format.json do
          render json: { :error => 'steam_id not found'}, status: :unprocessable_entity
        end
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    def set_game_by_slug
      @game = Game.find_by_title_slug(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:id, :title, :title_slug, :steam_id, :steam_url)
    end
end
