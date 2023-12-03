class RecommendationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  def create
    required_params = [:request_id, :recommendation_text]
    if required_params.any? { |param| params[param].blank? }
      error =  {"Error ":"Not all params are presented"}.to_json
      render json: error
    end
    consultation_request_id = params[:request_id]
    recommendation_text = params[:recommendation_text]
    record = ConsultationRequest.find_by_id(consultation_request_id)
    if record.presence
      current_time = DateTime.now
      recommendation = Recommendation.create(consultation_request_id: consultation_request_id, recommendation_text:recommendation_text, created_at:current_time)
      render json: recommendation
    else
      error =  {"Error ":"You need to create the consultation first. ID not Found"}.to_json
      render json: error
    end

  end
end