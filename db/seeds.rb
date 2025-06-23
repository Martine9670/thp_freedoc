# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "🧹 Suppression des données existantes..."
Appointment.destroy_all
DoctorSpecialty.destroy_all
Specialty.destroy_all
Doctor.destroy_all
Patient.destroy_all
City.destroy_all

puts "🌆 Création des villes..."
paris = City.create!(name: "Paris")
lyon = City.create!(name: "Lyon")

puts "💉 Création des spécialités..."
chirurgie = Specialty.create!(name: "Chirurgie")
oncologie = Specialty.create!(name: "Oncologie")
pediatrie = Specialty.create!(name: "Pédiatrie")

puts "🧑‍⚕️ Création des docteurs..."
dr_house = Doctor.create!(
  first_name: "Gregory", 
  last_name: "House", 
  zip_code: "75001", 
  city: paris
)

dr_wilson = Doctor.create!(
  first_name: "James", 
  last_name: "Wilson", 
  zip_code: "69001", 
  city: lyon
)

puts "⚕️ Attribution des spécialités aux docteurs..."
dr_house.specialties << chirurgie
dr_house.specialties << oncologie

dr_wilson.specialties << pediatrie

puts "🧍 Création des patients..."
john_doe = Patient.create!(
  first_name: "John", 
  last_name: "Doe", 
  city: paris
)

jane_smith = Patient.create!(
  first_name: "Jane", 
  last_name: "Smith", 
  city: lyon
)

puts "📅 Création des rendez-vous..."
Appointment.create!(
  date: DateTime.new(2025, 6, 25, 10, 0, 0),
  doctor: dr_house,
  patient: john_doe,
  city: paris
)

Appointment.create!(
  date: DateTime.new(2025, 6, 26, 14, 30, 0),
  doctor: dr_wilson,
  patient: jane_smith,
  city: lyon
)

puts "✅ Seeds terminés avec succès !"
