class AddDoctorAndPatientToAppointments < ActiveRecord::Migration[8.0]
  def change
    add_reference :appointments, :doctor, null: false, foreign_key: true
    add_reference :appointments, :patient, null: false, foreign_key: true
  end
end
