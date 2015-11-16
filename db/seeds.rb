# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
merchants = ['abc', "wwww", "weress", "kwepolq"]
merchants.each do |m|
  Merchant.create(name: m, status: 'active', price: rand(100), gender: 'male', review_count: rand(10), avg_rating: rand(5),
  email: "#{m}@gmail.com")
end

specializations = ["haircut", "yoga", "dance", "sports", "waxing"]

specializations.each do |s|
Specialization.create(name: s)
end

Merchant.all.each do |m|
  m.openings.create(start_time: Date.today, end_time: Date.today+3, status:'available')
  m.specializations << Specialization.order("RANDOM()").limit(2)
end




