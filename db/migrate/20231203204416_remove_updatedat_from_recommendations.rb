class RemoveUpdatedatFromRecommendations < ActiveRecord::Migration[7.1]
  def change
	remove_column :recommendations, :updated_at, :datetime
  end
end
