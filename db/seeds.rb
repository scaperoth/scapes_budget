# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

User.create!(email: ENV['app_user'], password: ENV['app_user_pass'], password_confirmation: ENV['app_user_pass'])

frequencies = %w(one-time daily weekly bi-weekly monthly yearly)

frequencies.each_with_index do |freq, idx|
  new_frequency = Frequency.new(name: freq, weight: idx)
  new_frequency.save
end

