class AddCityToDoctors < ActiveRecord::Migration[8.0]
  def change
add_reference :doctors, :city, null: true, foreign_key: true
  end
end
