require "csv"
require "faker"
puts "DESTROY --------------"
# Hpi.destroy_all
Encounter.destroy_all
User.destroy_all

importICD10 = true

puts "patients --------------"
#patients
30.times do
  fname = Faker::Name.unique.female_first_name
  lname = Faker::Name.last_name
  email = Faker::Internet.email
  # email = fname + "." + lname + "@patient.com"
  user = User.create!({ first_name: fname, last_name: lname, email: email, role: 0, password: "Patient1234" })

  Profile.create!(address1: Faker::Address.street_address, address2: "", city: Faker::Address.city, state: Faker::Address.state_abbr, zip: Faker::Address.zip, user: user)
  # Profile.create!(address1: Faker::Address.street_address, address2: "", city: Faker::Address.city, state: Faker::Address.state_abbr, zip: Faker::Address.zip, photo: Faker::Avatar.image, user: user)

  user.create_history
end

puts "physicians --------------"
#physicians
3.times do
  fname = Faker::Name.unique.first_name
  lname = Faker::Name.last_name
  email = Faker::Internet.email
  # email = fname + "." + lname + "@doctor.com"
  user = User.create!({ first_name: fname, last_name: lname, email: email, role: 3, password: "Physician1234" })

  Profile.create!(address1: Faker::Address.street_address, address2: "", city: Faker::Address.city, state: Faker::Address.state_abbr, zip: Faker::Address.zip, user: user)
end

puts "encounters --------------"
patients = User.all.select { |user| user.role == "patient" }
physicians = User.all.select { |user| user.role == "physician" }

e1 = Encounter.create(patient: patients[0], provider: physicians[0], status: "open")
e1.create_intake(complaint: Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote, appointment_at: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :day), checkin_at: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :day))
e1.create_hpi
e1.create_rosystem
e1.create_problem_exam
e1.create_diagnosis

e2 = Encounter.create(patient: patients[2], provider: physicians[1], status: "open")
e2.create_intake(complaint: Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote, appointment_at: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :day), checkin_at: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :day))
e2.create_hpi
e2.create_rosystem
e2.create_problem_exam
e2.create_diagnosis

e3 = Encounter.create(patient: patients[4], provider: physicians[2], status: "open")
e3.create_intake(complaint: Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote, appointment_at: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :day), checkin_at: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :day))
e3.create_hpi
e3.create_rosystem
e3.create_problem_exam
e3.create_diagnosis

e4 = Encounter.create(patient: patients[6], provider: physicians[0], status: "open")
e4.create_intake(complaint: Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote, appointment_at: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :day), checkin_at: Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :day))
e4.create_hpi
e4.create_rosystem
e4.create_problem_exam
e4.create_diagnosis

if importICD10
  Icd10.destroy_all
  puts "ICD10 --------------"
  csv_text = File.path(Rails.root.join("db", "Section111ValidICD10-Jan2020.csv"))
  count = 1
  CSV.foreach(csv_text) do |row|
    Icd10.create(code: row[0], description: row[1])
    count += 1
    if (count % 1000) == 0
      puts count
    end
  end
  puts "ICD10 import done " + count.to_s + " records"
end
puts "admin --------------"
#admin
user= User.create!({ first_name: "Clark", last_name: "Johnson", email: "clarkandkathy@gmail.com", role: 4, password: "Admin1234" })
Profile.create!(address1: Faker::Address.street_address, address2: "", city: Faker::Address.city, state: Faker::Address.state_abbr, zip: Faker::Address.zip, user: user)