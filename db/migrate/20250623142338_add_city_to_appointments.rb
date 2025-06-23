class AddCityToAppointments < ActiveRecord::Migration[8.0]
  def change
add_reference :appointments, :city, foreign_key: true, null: true
  end
end
