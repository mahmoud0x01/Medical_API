class CreateRequestForConsultations < ActiveRecord::Migration[7.1]
  def change
    create_table :request_for_consultations do |t|
      t.references :patient, null: false, foreign_key: true
      t.text :request_text
      t.date :creation_date

      t.timestamps
    end
  end
end
