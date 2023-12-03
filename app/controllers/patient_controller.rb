class PatientController < ApplicationController

	skip_before_action :verify_authenticity_token, only: [:recommendations]
	def recommendations
  		required_params = [:patient_id]
    	if required_params.any? { |param| params[param].blank? }
      		error =  {"Error ":"Not all params are presented"}.to_json
      		render json: error
    	end
    	patient_id = params[:patient_id]
    	patient = Patient.find_by_id(patient_id)
    	if patient.presence

    		recommendations = Recommendation.joins(:consultation_request).where(consultation_requests: { patient_id: patient_id })
    		if recommendations.nil? || recommendations.empty?

    			if ConsultationRequest.exists?(patient_id: patient_id)
    				consultation_id = ConsultationRequest.where(patient_id: patient_id).order(created_at: :desc).pluck(:id).first

    				keywords = ConsultationRequest.where(patient_id: patient_id).order(created_at: :desc).pluck(:text).first

					@diseases = OpenFdaApiService.get_diseases_by_keywords(keywords)
					if @diseases
						current_time = DateTime.now
						disease_names = @diseases.map { |disease| disease['patient']['reaction'][0]['reactionmeddrapt'] }
						Recommendation.create(consultation_request_id: consultation_id, recommendation_text: disease_names, created_at:current_time)
						json_response = {"Error":"We could not found recommendations for you yet. but now fetched data from OPENFDA as an alternative . make request again"}.to_json
    					render json:json_response

      				end
      			else
      				error =  {"Error ":"You do not made any consultation yet plz create one at /consultation_requests"}.to_json
      				render json: error
      			end

    		else   			
				json_response = recommendations.to_json
    			render json: json_response
    		end
    	else
    		error =  {"Error ":"Patient ID not Found"}.to_json
      		render json: error
  		end

  	end
end