class AddTextToConsultationRequests < ActiveRecord::Migration[7.1]
  def change
    add_column :consultation_requests, :text, :string
  end
end
