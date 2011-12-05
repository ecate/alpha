# == Schema Information
#
# Table name: rosters
#
#  id             :integer(4)      not null, primary key
#  codeactivite   :integer(4)
#  user_id        :integer(4)
#  convoc         :boolean(1)
#  but            :boolean(1)
#  butvilledepart :string(255)
#  comment        :text
#  harrivee       :datetime
#  hdepart        :datetime
#  created_at     :datetime
#  updated_at     :datetime
#

class Roster < ActiveRecord::Base
  belongs_to :user
  has_many :jours, :dependent => :destroy
  accepts_nested_attributes_for :jours, :reject_if => lambda { |attrs| attrs.all?{|key,value| value.blank?}} ,:allow_destroy => true

  attr_accessible :user_id, :codeactivite, :jours_attributes
  validates :user_id, :uniqueness => {:message => "Une seule declaration de presence" }

  def in_mission_range(n=1)

      n.times do
         jours.build
      end
      self

  end
end
