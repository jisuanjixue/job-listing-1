class AddTimeToJob < ActiveRecord::Migration[5.0]
  def change
  	add_column :jobs, :date_of_do, :datetime
  end
end
