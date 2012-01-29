class DemandeSpaMailer < ActionMailer::Base
  default :from => "marine.serre@gmail.com"

  #pour une mission données, on envoie à tous les personnels un compte-rendu
  def compterendu_spa(r)
    @roster= r

    mail(:to => @roster.user.email,
           :subject => "SPA pour  #{@roster.mission.name}")
  end

  def welcome_email(user)
    @user = user
    @url = "http://localhost:3000/rosters"
    mail(:to => user.email, :subject => "SPA modifié")

  end

end
