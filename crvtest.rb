require "csv"

CSV.foreach("Section111ValidICD10-Jan2020copy.csv") do |row|
  ICD10.create(code: row[0], description: row[1])
end
