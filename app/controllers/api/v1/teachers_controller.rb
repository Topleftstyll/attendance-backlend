class Api::V1::TeachersController < ApplicationController
  before_action :set_api_v1_teacher, only: %i[ show update destroy ]

  # GET /api/v1/teachers
  def index
    new_teachers_list = []
    current_user.teachers.all.each do |teacher|
      new_teachers_list << {
        id: teacher.id,
        first_name: teacher.first_name,
        last_name: teacher.last_name,
        full_name: "#{teacher.first_name} #{teacher.last_name}",
        group: teacher.group
      }
    end

    render json: new_teachers_list
  end

  # GET /api/v1/teachers/1
  def show
    render json: {
      id: @api_v1_teacher.id,
      first_name: @api_v1_teacher.first_name,
      last_name: @api_v1_teacher.last_name,
      full_name: "#{@api_v1_teacher.first_name} #{@api_v1_teacher.last_name}",
      group: @api_v1_teacher.group,
      groups: current_user.groups
    }
  end

  # POST /api/v1/teachers
  def create
    @api_v1_teacher = Api::V1::Teacher.new(api_v1_teacher_params)

    if @api_v1_teacher.save
      render json: @api_v1_teacher, status: :created, location: @api_v1_teacher
    else
      render json: @api_v1_teacher.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/teachers/1
  def update
    if @api_v1_teacher.update(api_v1_teacher_params)
      render json: {
        id: @api_v1_teacher.id,
        first_name: @api_v1_teacher.first_name,
        last_name: @api_v1_teacher.last_name,
        full_name: "#{@api_v1_teacher.first_name} #{@api_v1_teacher.last_name}",
        group: @api_v1_teacher.group,
        groups: current_user.groups
      }
    else
      render json: @api_v1_teacher.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/teachers/1
  def destroy
    @api_v1_teacher.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_teacher
      @api_v1_teacher = current_user.teachers.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_teacher_params
      params.require(:api_v1_teacher).permit(:first_name, :last_name, :user_id, :group_id)
    end
end
