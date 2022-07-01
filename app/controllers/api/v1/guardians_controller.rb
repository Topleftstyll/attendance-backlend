class Api::V1::GuardiansController < ApplicationController
  before_action :set_api_v1_guardian, only: %i[ show update destroy ]

  # GET /api/v1/guardians
  def index
    new_guardians_list = []
    current_user.guardians.all.each do |guardian|
      children_arr = []
      guardian.children.each do |child|
        children_arr << {
          id: child.id,
          first_name: child.first_name,
          last_name: child.last_name,
          full_name: "#{child.first_name} #{child.last_name}",
          group: child.group
        }
      end

      new_guardians_list << {
        id: guardian.id,
        first_name: guardian.first_name,
        last_name: guardian.last_name,
        full_name: "#{guardian.first_name} #{guardian.last_name}",
        children: children_arr
      }
    end

    render json: new_guardians_list
  end

  # GET /api/v1/guardians/1
  def show
    render json: {
      id: @api_v1_guardian.id,
      first_name: @api_v1_guardian.first_name,
      last_name: @api_v1_guardian.last_name,
      full_name: "#{@api_v1_guardian.first_name} #{@api_v1_guardian.last_name}",
      children: @api_v1_guardian.children
    }
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
      @api_v1_guardian = current_user.guardians.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_guardian_params
      params.require(:api_v1_guardian).permit(:name, :email, :phone_number, :child_id)
    end
end
