# == Schema Information
#
# Table name: missions
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Mission < ActiveRecord::Base
  has_many :convocationjourses
  has_many :rosters

  has_many :jours, :through => :rosters
  has_many :users, :through => :rosters
end
