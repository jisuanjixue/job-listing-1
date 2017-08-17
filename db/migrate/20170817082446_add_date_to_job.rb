class AddDateToJob < ActiveRecord::Migration[5.0]
  def change
  	add_column :jobs, :date_of_make, :datetime
  end
end
