class StundentsController < ApplicationController
  before_action :set_stundent, only: %i[ show edit update destroy ]

  # GET /stundents or /stundents.json
  def index
    @stundents = Stundent.all
  end

  # GET /stundents/1 or /stundents/1.json
  def show
  end

  # GET /stundents/new
  def new
    @stundent = Stundent.new
  end

  # GET /stundents/1/edit
  def edit
  end

  # POST /stundents or /stundents.json
  def create
    @stundent = Stundent.new(stundent_params)

    respond_to do |format|
      if @stundent.save
        format.html { redirect_to stundent_url(@stundent), notice: "Stundent was successfully created." }
        format.json { render :show, status: :created, location: @stundent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stundent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stundents/1 or /stundents/1.json
  def update
    respond_to do |format|
      if @stundent.update(stundent_params)
        format.turbo_stream`
        format.html { redirect_to stundent_url(@stundent), notice: "Stundent was successfully updated." }
        format.json { render :show, status: :ok, location: @stundent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stundent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stundents/1 or /stundents/1.json
  def destroy
    @stundent.destroy

    respond_to do |format|
      format.html { redirect_to stundents_url, notice: "Stundent was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stundent
      @stundent = Stundent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stundent_params
      params.require(:stundent).permit(:name)
    end
end
