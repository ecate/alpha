# == Schema Information
#
# Table name: rosters
#
#  id             :integer(4)      not null, primary key
#  codeactivite   :integer(4)
#  user_id        :integer(4)
#  created_at     :datetime
#  updated_at     :datetime
#  convoc         :boolean(1)
#  but            :boolean(1)
#  butvilledepart :string(255)
#  comment        :text
#  harrivee       :datetime
#  hdepart        :datetime
#

class Roster < ActiveRecord::Base
  belongs_to :user
  has_many :jours

  attr_accessible :user_id, :codeactivite
  validates :user_id, :uniqueness => {:message => "Une seule declaration de presence" }
end
