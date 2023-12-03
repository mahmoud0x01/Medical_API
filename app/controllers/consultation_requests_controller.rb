class ConsultationRequestsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    required_params = [:full_name, :date_of_birth, :phone_number, :email, :text]
    if required_params.any? { |param| params[param].blank? }
      error =  {"Error ":"Not all params are presented"}.to_json
      render json: error
    end
    #patient_id = params[:patient_id].to_i
    #patient = Patient.find_or_create_by(id: patient_id) # assert coloumn of data with id = patient_id
    full_name = params[:full_name]
    date_of_birth = params[:date_of_birth]
    phone_number = params[:phone_number]
    email = params[:email]
    text = params[:text]

    '''
    if Patient.exists?(id: patient_id)
      error =  {"Error ":"{Patient with ID #{patient_id} exists in the database}"}.to_json
      render json: error
    '''

    #if patient.new_record?
    patient = Patient.create(full_name: full_name, date_of_birth: date_of_birth, phone_number: phone_number, email: email)
    #end
    if patient.valid?
      current_time = DateTime.now
      request = ConsultationRequest.create(patient_id:patient.id, text:text,created_at:current_time)
      render json: request
        # You can also render an error message or take other actions as needed
    end

  end

end
