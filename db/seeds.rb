# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

doctors = Doctor.create([
  { firstName: "doctor1", lastName: "Smith", email: "doctor1@doctor.com" },
  { firstName: "doctor2", lastName: "Smith", email: "doctor2@doctor.com" },
  { firstName: "doctor3", lastName: "Smith", email: "doctor3@doctor.com" },
  { firstName: "doctor4", lastName: "Smith", email: "doctor4@doctor.com" },
  { firstName: "doctor5", lastName: "Smith", email: "doctor5@doctor.com" },
  { firstName: "doctor6", lastName: "Smith", email: "doctor6@doctor.com" },
  { firstName: "doctor7", lastName: "Smith", email: "doctor7@doctor.com" },
  { firstName: "doctor8", lastName: "Smith", email: "doctor8@doctor.com" },
])

patients = Patient.create([
  { firstName: "patient1", lastName: "Smith", email: "patient1@patient.com" },
  { firstName: "patient2", lastName: "Smith", email: "patient2@patient.com" },
  { firstName: "patient3", lastName: "Smith", email: "patient3@patient.com" },
  { firstName: "patient4", lastName: "Smith", email: "patient4@patient.com" },
  { firstName: "patient5", lastName: "Smith", email: "patient5@patient.com" },
  { firstName: "patient6", lastName: "Smith", email: "patient6@patient.com" },
  { firstName: "patient7", lastName: "Smith", email: "patient7@patient.com" },
  { firstName: "patient8", lastName: "Smith", email: "patient8@patient.com" },
])

kinds = ["New Patient", "Follow-up", "Yearly Physical"]

doctors.each do |doctor|
  patient = Patient.find(Patient.pluck(:id).sample)
  time = doctor.get_available_times.sample

  doctor.appointments.create({ 
    patient: patient, time: time, kind: kinds.sample
  })
end
