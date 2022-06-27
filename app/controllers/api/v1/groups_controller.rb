class Api::V1::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_api_v1_group, only: %i[ show update destroy ]

  # GET /api/v1/groups
  def index
    @api_v1_groups = current_user.groups

    render json: @api_v1_groups
  end

  # GET /api/v1/groups/1
  def show
    render json: {
      'group': @api_v1_group,
      'children': @api_v1_group.children
    }
  end

  # POST /api/v1/groups
  def create
    @api_v1_group = Api::V1::Group.new(api_v1_group_params)

    if @api_v1_group.save
      render json: @api_v1_group, status: :created, location: @api_v1_group
    else
      render json: @api_v1_group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/groups/1
  def update
    if @api_v1_group.update(api_v1_group_params)
      render json: @api_v1_group
    else
      render json: @api_v1_group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/groups/1
  def destroy
    @api_v1_group.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_group
      @api_v1_group = current_user.groups.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_group_params
      params.require(:api_v1_group).permit(:name, :user_id, :children_count, :note)
    end
end
