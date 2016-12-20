# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: ENV['ADMIN_USER'], password: ENV['ADMIN_USER_PASS'], password_confirmation: ENV['ADMIN_USER_PASS'])

#User.create!(fname: "Matthew", lname: "Scaperoth", username: "scaperoth", email: ENV['APP_USER'], password: ENV['APP_USER_PASS'], password_confirmation: ENV['APP_USER_PASS'])

frequencies = %w(one-time daily weekly bi-weekly monthly yearly)

frequencies.each_with_index do |freq, idx|
  new_frequency = Frequency.new(name: freq, weight: idx)
  new_frequency.save
end

