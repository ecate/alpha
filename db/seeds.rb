# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

#GRADES
Corp.create!([{:nom => "Militaire du rang"},{:nom => "Sous-officier"}, {:nom => "Officier"}])
Grade.create!([{:nom => "Sapeur de 2ème Classe", :corp_id => 1},{:nom => "Sapeur de 1ère Classe", :corp_id => 1},{:nom => "Caporal", :corp_id => 1},{:nom => "Caporal-Chef", :corp_id => 1},{:nom => "Sergent", :corp_id => 2},{:nom => "Sergent-Chef", :corp_id => 2},{:nom => "Adjudant", :corp_id => 2},{:nom => "Adjudant-Chef", :corp_id => 2},{:nom => "Major", :corp_id => 2},{:nom => "Aspirant", :corp_id => 3},{:nom => "Sous-Lieutenant", :corp_id => 3},{:nom => "Lieutenant", :corp_id => 3},{:nom => "Capitaine", :corp_id => 3}])

# MISSIONS
m1= Mission.create!(:name => "seance fevrier", :description => "Séance de travaux concassage et chantier piste. CTE engins et VF pour les autres. Précurseurs jeudi et vendredi. Post curseur : Lundi.", :encours => true, :code_activite => 546)
m2= Mission.create!(:name => "Garde à Besançon", :description => "Garde du dépot de munition à Besançon, en support de la 5ème UIR", :encours => true, :code_activite => 898)

Convocationjour.create!([{:mission_id => m1.id, :jourconvoc => Date.today},{:mission_id => m1.id, :jourconvoc => Date.today + 1.day},{:mission_id => m1.id, :jourconvoc => Date.today + 2.days},{:mission_id => m1.id, :jourconvoc => Date.today + 3.days},{:mission_id => m1.id, :jourconvoc => Date.today + 10.days},{:mission_id => m1.id, :jourconvoc => Date.today + 11.days}])
Convocationjour.create!([{:mission_id => m2.id, :jourconvoc => Date.today},{:mission_id => m2.id, :jourconvoc => Date.today + 1.day},{:mission_id => m2.id, :jourconvoc => Date.today + 2.days},{:mission_id => m2.id, :jourconvoc => Date.today + 3.days},{:mission_id => m2.id, :jourconvoc => Date.today + 10.days},{:mission_id => m2.id, :jourconvoc => Date.today + 11.days}])

#Personnels
User.create!(:prenom => "petit", :nom => "Admin", :grade_id => 5, :actif => false,:role => 'compagnie', :email => "marine.serre@gmail.com", :password => 'oracle', :confirmation => 'oracle')

u1= User.create!(:prenom => "Jérôme", :nom => "Ansel", :grade_id => 13, :actif => true,:role => 'compagnie', :email => "jerome.ansel@orange.fr", :password => 'jansel', :confirmation => 'jansel')
u2= User.create!(:prenom => "Catherine", :nom => "Cusset", :grade_id => 2, :actif => true,:role => 'personnel', :email => "marine.serre+cusset@gmail.com", :password => 'motdepasse', :confirmation => 'motdepasse')
u3= User.create!(:prenom => "John", :nom => "Jenkins", :grade_id => 3, :actif => true,:role => 'personnel', :email => "marine.serre+jenkins@gmail.com", :password => 'motdepasse', :confirmation => 'motdepasse')
u4= User.create!(:prenom => "Rubin", :nom => "Berkovitz", :grade_id => 5, :actif => true,:role => 'personnel', :email => "marine.serre+berkovitz@gmail.com", :password => 'motdepasse', :confirmation => 'motdepasse')
u5= User.create!(:prenom => "Jérôme", :nom => "Cornette", :grade_id => 7, :actif => true,:role => 'section', :email => "marine.serre+cornette@gmail.com", :password => 'motdepasse', :confirmation => 'motdepasse')
u6= User.create!(:prenom => "Walter", :nom => "Sebald", :grade_id => 8, :actif => true,:role => 'section', :email => "marine.serre+sebald@gmail.com", :password => 'motdepasse', :confirmation => 'motdepasse')
u7= User.create!(:prenom => "Régis", :nom => "Jauffret", :grade_id => 11, :actif => true,:role => 'compagnie', :email => "marine.serre+jauffret@gmail.com", :password => 'motdepasse', :confirmation => 'motdepasse')

# Création des SPA
r1= Roster.create!(:mission_id => m1.id, :user_id => u1.id, :convoc => true, :but => true, :butvilledepart => "Paris")

r2= Roster.create!(:mission_id => m1.id, :user_id => u2.id, :convoc => false, :but => true, :butvilledepart => "Champs sur marne")

r3= Roster.create!(:mission_id => m1.id, :user_id => u3.id, :convoc => true, :but => false)

r4= Roster.create!(:mission_id => m1.id, :user_id => u4.id, :convoc => false, :but =>true, :butvilledepart => "Chantilly")

r5= Roster.create!(:mission_id => m1.id, :user_id => u5.id, :convoc => false, :but => false)

r6=Roster.create!(:mission_id => m1.id, :user_id => u6.id, :convoc => true, :but => true, :butvilledepart => "Chaumont")
r7=Roster.create!(:mission_id => m1.id, :user_id => u7.id, :convoc => true, :but => true, :butvilledepart => "Dijon")


Jour.create!(:roster_id => r1.id, :convocationjour_id => 3)
Jour.create!(:roster_id => r1.id, :convocationjour_id => 4)
Jour.create!(:roster_id => r1.id, :convocationjour_id => 5)
Jour.create!(:roster_id => r1.id, :convocationjour_id => 6)

Jour.create!(:roster_id => r3.id, :convocationjour_id => 1)
Jour.create!(:roster_id => r3.id, :convocationjour_id => 2)
Jour.create!(:roster_id => r3.id, :convocationjour_id => 3)
Jour.create!(:roster_id => r3.id, :convocationjour_id => 4)

Jour.create!(:roster_id => r4.id, :convocationjour_id => 3)
Jour.create!(:roster_id => r4.id, :convocationjour_id => 4)
Jour.create!(:roster_id => r4.id, :convocationjour_id => 5)

Jour.create!(:roster_id => r5.id, :convocationjour_id => 1)
Jour.create!(:roster_id => r5.id, :convocationjour_id => 2)
Jour.create!(:roster_id => r5.id, :convocationjour_id => 3)
Jour.create!(:roster_id => r5.id, :convocationjour_id => 4)
Jour.create!(:roster_id => r5.id, :convocationjour_id => 5)
Jour.create!(:roster_id => r5.id, :convocationjour_id => 6)

Jour.create!(:roster_id => r6.id, :convocationjour_id => 5)
Jour.create!(:roster_id => r6.id, :convocationjour_id => 6)
