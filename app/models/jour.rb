# == Schema Information
#
# Table name: jours
#
#  id          :integer(4)      not null, primary key
#  roster_id   :integer(4)
#  jourpresent :date
#  created_at  :datetime
#  updated_at  :datetime
#

class Jour < ActiveRecord::Base
  belongs_to :roster
  validates :jourpresent, :uniqueness => {:message => "Jour de presence deja pris en compte" }
end


