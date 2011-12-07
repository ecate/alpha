# == Schema Information
#
# Table name: jours
#
#  id                  :integer(4)      not null, primary key
#  roster_id           :integer(4)
#  created_at          :datetime
#  updated_at          :datetime
#  convocationjours_id :integer(4)
#

class Jour < ActiveRecord::Base
  belongs_to :roster
  belongs_to :convocationjours

  attr_accessible :roster_id, :convocationjours_id
end


