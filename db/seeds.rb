# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

frequencies = %w(one-time daily weekly bi-weekly monthly yearly)

frequencies.each_with_index do |freq, idx|
  new_frequency = Frequency.new(name: freq, weight: idx)
  new_frequency.save
end

Budget.new(name: "Matt's 2017", planned_savings: 10000, frequency_id: 5)
