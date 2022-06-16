class PlanetsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :error_NF

  # rescue_from ActiveRecord::RecordInvalid, with: :error_UE

  # GET /planets
  def index
    render json: Planet.all, status: :ok
  end

  private

  #--------------   ERRORS   --------------#
  def error_NF
    render json: { error: 'Planet not found' }, status: :not_found
  end

  # def error_UE(exception)
  #   render json: {
  #            errors: exception.record.errors.full_messages,
  #          },
  #          status: :unprocessable_entity
  # end
end
