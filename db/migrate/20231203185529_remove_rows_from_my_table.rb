class RemoveRowsFromMyTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :consultation_requests, :request_text, :string
    remove_column :consultation_requests, :creation_date, :datetime
  end
end