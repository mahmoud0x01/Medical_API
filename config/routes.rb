Rails.application.routes.draw do
  post '/consultation_requests', to: 'consultation_requests#create'
  post '/consultation_requests/:request_id/recommendations', to: 'recommendations#create'
  get '/patients/:patient_id/recommendations', to: 'patient#recommendations'
end