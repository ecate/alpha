# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Mission.create!([{:name => "seance fevrier"},{:name => "Garde à besançon mars"} ])
Convocationjour.create!([{:mission_id => m1.id, :jourconvoc => Date.today},{:mission_id => m1.id, :jourconvoc => Date.today + 1.day},{:mission_id => m1.id, :jourconvoc => Date.today + 2.days},{:mission_id => m1.id, :jourconvoc => Date.today + 3.days},{:mission_id => m1.id, :jourconvoc => Date.today + 10.days},{:mission_id => m1.id, :jourconvoc => Date.today + 11.days}])
Convocationjour.create!([{:mission_id => 2, :jourconvoc => Date.today},{:mission_id => 2, :jourconvoc => Date.today + 1.day},{:mission_id => 2, :jourconvoc => Date.today + 2.days},{:mission_id => 2, :jourconvoc => Date.today + 3.days},{:mission_id => 2, :jourconvoc => Date.today + 10.days},{:mission_id => 2, :jourconvoc => Date.today + 11.days}])
