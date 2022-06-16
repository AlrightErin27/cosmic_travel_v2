class MissionsController < ApplicationController
  #   rescue_from ActiveRecord::RecordNotFound, with: :error_NF
  rescue_from ActiveRecord::RecordInvalid, with: :error_UE

  # POST /missions
  def create
    mission = Mission.create!(mission_params)
    render json: mission.planet, status: :created
  end

  private

  #--------------   PARAMS   --------------#
  def mission_params
    params.permit(:name, :scientist_id, :planet_id)
  end

  #--------------   ERRORS   --------------#
  # def error_NF
  #   render json: { error: 'Mission not found' }, status: :not_found
  # end

  def error_UE(exception)
    render json: {
             errors: exception.record.errors.full_messages,
           },
           status: :unprocessable_entity
  end
end
