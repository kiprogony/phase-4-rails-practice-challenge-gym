class GymsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found

  def show
    render json: get_gym, status: :ok
  end

  def destroy
    get_gym.destroy
    render json: {}, status: :ok
  end

  private

  def get_gym
    Gym.find(params[:id])
  end

  def render_record_not_found
    render json: {error: "Gym not found" }, status: :not_found
  end
end
