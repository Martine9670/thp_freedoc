class AddCityToPatients < ActiveRecord::Migration[8.0]
  def change
add_reference :patients, :city, foreign_key: true, null: true
  end
end
