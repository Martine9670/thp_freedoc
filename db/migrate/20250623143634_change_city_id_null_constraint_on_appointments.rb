class ChangeCityIdNullConstraintOnAppointments < ActiveRecord::Migration[8.0]
  def change
    change_column_null :appointments, :city_id, false
  end
end
