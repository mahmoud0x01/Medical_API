require 'test_helper'

class ConsultationRequestsControllerTest < ActionController::TestCase
  setup do
    @patient = patients(:one) # Assuming you have a fixture or factory for patients
  end

  test 'should create a consultation request' do
    assert_difference('ConsultationRequest.count') do
      post :create, params: {
        consultation_request: {
          patient_id: @patient.id,
          text: 'Test consultation request',
          created_at: Time.current
        }
      }
    end

    assert_response :success
    assert_equal 'application/json', response.content_type

    request = JSON.parse(response.body)
    assert_equal @patient.id, request['patient_id']
    assert_equal 'Test consultation request', request['text']
    assert_not_nil request['created_at']
  end
end 