class Api::V1::ChildrenController < ApplicationController
  before_action :authenticate_user!
  before_action :set_api_v1_child, only: %i[ show update destroy ]

  # GET /api/v1/children
  def index
    new_children_list = []

    group_ids_list = current_user.groups.map do |group| group.id end

    Api::V1::Child.all.where(id: group_ids_list).each do |child|
      new_children_list << {
        id: child.id,
        first_name: child.first_name,
        last_name: child.last_name,
        full_name: "#{child.first_name} #{child.last_name}",
        teacher: nil,
        attendance: nil,
        guardian: nil,
        group: child.group
      }
    end

    render json: new_children_list
  end

  # GET /api/v1/children/1
  def show
    render json: {
      id: @api_v1_child.id,
      first_name: @api_v1_child.first_name,
      last_name: @api_v1_child.last_name,
      full_name: "#{@api_v1_child.first_name} #{@api_v1_child.last_name}",
      teacher: nil,
      attendance: nil,
      guardian: nil,
      group: @api_v1_child.group,
      groups: current_user.groups
    }
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
      render json: {
        id: @api_v1_child.id,
        first_name: @api_v1_child.first_name,
        last_name: @api_v1_child.last_name,
        full_name: "#{@api_v1_child.first_name} #{@api_v1_child.last_name}",
        teacher: nil,
        attendance: nil,
        guardian: nil,
        group: @api_v1_child.group,
        groups: current_user.groups
      }
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
      params.require(:api_v1_child).permit(:first_name, :last_name, :group_id, :teacher_id, :attendance_id)
    end
end
