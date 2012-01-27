class DemandeSpaMailer < ActionMailer::Base
  default :from => "marine.serre@gmail.com"

  #pour une mission données, on envoie à tous les personnels un compte-rendu
  def compterendu_spa(r)
    @roster= r

    mail(:to => @roster.user.email,
           :subject => "SPA pour  #{@roster.mission.name}")
  end

end
