class GratitudesController < ApplicationController
  before_action :set_gratitude, only: %i[ show edit update destroy ]

  # GET /gratitudes
  def index
    @gratitudes = Gratitude.all
  end

  # GET /gratitudes/1
  def show
  end

  # GET /gratitudes/new
  def new
    @gratitude = Gratitude.new
  end

  # GET /gratitudes/1/edit
  def edit
  end

  # POST /gratitudes
  def create
    @gratitude = Gratitude.new(gratitude_params)

    if @gratitude.save
      redirect_to @gratitude, notice: "Gratitude was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gratitudes/1
  def update
    if @gratitude.update(gratitude_params)
      redirect_to @gratitude, notice: "Gratitude was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /gratitudes/1
  def destroy
    @gratitude.destroy!
    redirect_to gratitudes_url, notice: "Gratitude was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gratitude
      @gratitude = Gratitude.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gratitude_params
      params.require(:gratitude).permit(:content, :entry_date)
    end
end
