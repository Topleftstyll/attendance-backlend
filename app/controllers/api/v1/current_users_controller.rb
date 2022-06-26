class Api::V1::CurrentUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_api_v1_child, only: %i[ show update destroy ]

  # GET /api/v1/current-user check if authenticated
  def index
    @api_v1_current_user = current_user

    render json: @api_v1_current_user
  end
end  