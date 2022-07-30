class MembershipsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  def create
    membership = Membership.create!(membership_params)
    render json: membership, status: :created
  end

  private

  def membership_params
    params.require(:membership).permit(:gym_id, :client_id, :charge)
  end

  def render_unprocessable_entity(exception)
    render json: { errors: exception.record.errors.full_meaasges }, status: :unprocessable_entity
  end
end
