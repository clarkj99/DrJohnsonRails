# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

#admin
User.create({ first_name: "Clark", last_name: "Johnson", email: "clarkandkathy@gmail.com", role: 4, password: "Admin1234" })

#patients
10.times do
  fname = Faker::Name.female_first_name
  lname = Faker::Name.last_name
  email = fname + "." + lname + "@patient.com"
  User.create({ first_name: fname, last_name: lname, email: email, role: 0, password: "Patient1234" })
end

#physicians
3.times do
  fname = Faker::Name.first_name
  lname = Faker::Name.last_name
  email = fname + "." + lname + "@doctor.com"
  User.create({ first_name: fname, last_name: lname, email: email, role: 3, password: "Physician1234" })
end
