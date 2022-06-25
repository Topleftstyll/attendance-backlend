class Api::V1::ChildrenController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_api_v1_child, only: %i[ show update destroy ]

  # GET /api/v1/children
  def index
    @api_v1_children = Api::V1::Child.all
    puts current_user.inspect

    render json: @api_v1_children
  end

  # GET /api/v1/children/1
  def show
    render json: @api_v1_child
  end

  # POST /api/v1/children
  def create
    @api_v1_child = Api::V1::Child.new(api_v1_child_params)

    if @api_v1_child.save
      render json: @api_v1_child, status: :created, location: @api_v1_child
    else
      render json: @api_v1_child.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/children/1
  def update
    if @api_v1_child.update(api_v1_child_params)
      render json: @api_v1_child
    else
      render json: @api_v1_child.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/children/1
  def destroy
    @api_v1_child.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_child
      @api_v1_child = Api::V1::Child.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_child_params
      params.require(:api_v1_child).permit(:first_name, :last_name, :teacher_id, :attendance_id)
    end
end
