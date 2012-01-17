# == Schema Information
#
# Table name: jours
#
#  id                 :integer(4)      not null, primary key
#  roster_id          :integer(4)
#  created_at         :datetime
#  updated_at         :datetime
#  convocationjour_id :integer(4)
#

class Jour < ActiveRecord::Base
  belongs_to :roster, :dependent => :destroy
  belongs_to :convocationjour, :dependent => :destroy

  attr_accessible :roster_id, :convocationjour_id
end


