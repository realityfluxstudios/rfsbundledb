class MusictracksController < ApplicationController
  before_action :set_musictrack, only: [:show, :edit, :update, :destroy]

  # GET /musictracks
  # GET /musictracks.json
  def index
    @musictracks = Musictrack.all
  end

  # GET /musictracks/1
  # GET /musictracks/1.json
  def show
  end

  # GET /musictracks/new
  def new
    @musictrack = Musictrack.new
  end

  # GET /musictracks/1/edit
  def edit
  end

  # POST /musictracks
  # POST /musictracks.json
  def create
    @musictrack = Musictrack.new(musictrack_params)

    respond_to do |format|
      if @musictrack.save
        format.html { redirect_to @musictrack, notice: 'Musictrack was successfully created.' }
        format.json { render :show, status: :created, location: @musictrack }
      else
        format.html { render :new }
        format.json { render json: @musictrack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /musictracks/1
  # PATCH/PUT /musictracks/1.json
  def update
    respond_to do |format|
      if @musictrack.update(musictrack_params)
        format.html { redirect_to @musictrack, notice: 'Musictrack was successfully updated.' }
        format.json { render :show, status: :ok, location: @musictrack }
      else
        format.html { render :edit }
        format.json { render json: @musictrack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /musictracks/1
  # DELETE /musictracks/1.json
  def destroy
    @musictrack.destroy
    respond_to do |format|
      format.html { redirect_to musictracks_url, notice: 'Musictrack was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_musictrack
      @musictrack = Musictrack.find_by_title_slug(params[:titleSlug])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def musictrack_params
      params[:musictrack]
    end
end
