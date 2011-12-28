class DemandeSpaMailer < ActionMailer::Base
  default from: "marine.serre@gmail.com"

  #pour une mission données, on envoie à tous les personnels un compte-rendu
  def envoi_demande_spa(mi)
      mail(:to => User.all.map(&:email),
           :subject => "SPA pour #{mi.name}")
  end

end
