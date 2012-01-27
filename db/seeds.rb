# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Mission.create!([{:name => "seance fevrier"},{:name => "Garde à besançon mars"} ])
Convocationjour.create!([{:mission_id => m1.id, :jourconvoc => Date.today},{:mission_id => m1.id, :jourconvoc => Date.today + 1.day},{:mission_id => m1.id, :jourconvoc => Date.today + 2.days},{:mission_id => m1.id, :jourconvoc => Date.today + 3.days},{:mission_id => m1.id, :jourconvoc => Date.today + 10.days},{:mission_id => m1.id, :jourconvoc => Date.today + 11.days}])
Convocationjour.create!([{:mission_id => m2.id, :jourconvoc => Date.today},{:mission_id => m2.id, :jourconvoc => Date.today + 1.day},{:mission_id => m2.id, :jourconvoc => Date.today + 2.days},{:mission_id => m2.id, :jourconvoc => Date.today + 3.days},{:mission_id => m2.id, :jourconvoc => Date.today + 10.days},{:mission_id => m2.id, :jourconvoc => Date.today + 11.days}])

Corp.create!([{:nom => "Militaire du rang"},{:nom => "Sous-officier"}, {:nom => "Officier"}])
Grade.create!([{:nom => "Sapeur de 2ème Classe", :corp_id => 1},{:nom => "Sapeur de 1ère Classe", :corp_id => 1},{:nom => "Caporal", :corp_id => 1},{:nom => "Caporal-Chef", :corp_id => 1},{:nom => "Sergent", :corp_id => 2},{:nom => "Sergent-Chef", :corp_id => 2},{:nom => "Adjudant", :corp_id => 2},{:nom => "Adjudant-Chef", :corp_id => 2},{:nom => "Major", :corp_id => 2},{:nom => "Aspirant", :corp_id => 3},{:nom => "Sous-Lieutenant", :corp_id => 3},{:nom => "Lieutenant", :corp_id => 3},{:nom => "Capitaine", :corp_id => 3}])