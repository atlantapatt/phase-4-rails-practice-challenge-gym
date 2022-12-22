class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    
    def create
        membership = Membership.create(member_params)
        if membership.valid?
             render json: membership, status: :created
        else
            render_unprocessable_entity_response
        end
    end


    private

    def member_params
        params.permit(:gym_id, :client_id, :charge)
    end

    def render_not_found_response
        render json: { error: "Membership not found" }, status: :not_found
    end

    def render_unprocessable_entity_response
        render json: { error: "Membership not found" }, status: :not_found
    end
end
