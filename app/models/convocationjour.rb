# == Schema Information
#
# Table name: convocationjours
#
#  id         :integer(4)      not null, primary key
#  mission_id :integer(4)
#  jourconvoc :date
#  created_at :datetime
#  updated_at :datetime
#

class Convocationjour < ActiveRecord::Base
  belongs_to :mission, :dependent => :destroy
  has_many :jours, :dependent => :destroy
  has_many :rosters, :through => :jours

end
