class ConsultationRequest < ApplicationRecord
  belongs_to :patient
  has_one :recommendation
  attribute :text, :string
end
