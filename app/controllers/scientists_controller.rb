class ScientistsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :error_NF
  rescue_from ActiveRecord::RecordInvalid, with: :error_UE

  # GET /scientists
  def index
    render json: Scientist.all, status: :ok
  end

  # GET /scientists/:id
  def show
    sci = find_scientist
    render json: sci, serializer: DetailedScientistSerializer, status: :ok
  end

  # POST /scientists
  def create
    sci = Scientist.create!(scientist_params)
    render json: sci, status: :created
  end

  # PATCH /scientists/:id
  def update
    sci = find_scientist
    sci.update!(scientist_params)
    render json: sci, status: :accepted
  end

  # DELETE /scientists/:id
  def destroy
    sci = find_scientist
    sci.destroy
    head :no_content
  end

  #------------------ 🤐 ------------------#
  private

  def find_scientist
    Scientist.find(params[:id])
  end

  #--------------   PARAMS   --------------#
  def scientist_params
    params.permit(:name, :field_of_study, :avatar)
  end

  #--------------   ERRORS   --------------#
  def error_NF
    render json: { error: 'Scientist not found' }, status: :not_found
  end

  def error_UE(exception)
    render json: {
             errors: exception.record.errors.full_messages,
           },
           status: :unprocessable_entity
  end
end
