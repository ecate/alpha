# == Schema Information
#
# Table name: rosters
#
#  id             :integer(4)      not null, primary key
#  user_id        :integer(4)
#  created_at     :datetime
#  updated_at     :datetime
#  convoc         :boolean(1)
#  but            :boolean(1)
#  butvilledepart :string(255)
#  comment        :text
#  harrivee       :datetime
#  hdepart        :datetime
#  mission_id     :integer(4)
#

class Roster < ActiveRecord::Base
  belongs_to :user
  belongs_to :mission
  has_many :jours, :dependent => :destroy
  has_many :convocationjours, :through => :jours


  attr_accessible :user_id, :mission_id, :convoc, :but, :butvilledepart, :comment, :harrivee, :hdepart
  #validates :user_id, :uniqueness => {:message => "Une seule declaration de presence" }

end
