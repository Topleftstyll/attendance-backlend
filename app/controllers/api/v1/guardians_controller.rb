class Api::V1::GuardiansController < ApplicationController
  before_action :set_api_v1_guardian, only: %i[ show update destroy ]

  # GET /api/v1/guardians
  def index
    @api_v1_guardians = Api::V1::Guardian.all

    render json: @api_v1_guardians
  end

  # GET /api/v1/guardians/1
  def show
    render json: @api_v1_guardian
  end

  # POST /api/v1/guardians
  def create
    @api_v1_guardian = Api::V1::Guardian.new(api_v1_guardian_params)

    if @api_v1_guardian.save
      render json: @api_v1_guardian, status: :created, location: @api_v1_guardian
    else
      render json: @api_v1_guardian.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/guardians/1
  def update
    if @api_v1_guardian.update(api_v1_guardian_params)
      render json: @api_v1_guardian
    else
      render json: @api_v1_guardian.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/guardians/1
  def destroy
    @api_v1_guardian.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_guardian
      @api_v1_guardian = Api::V1::Guardian.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_guardian_params
      params.require(:api_v1_guardian).permit(:name, :email, :phone_number, :child_id)
    end
end
