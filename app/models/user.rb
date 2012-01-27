# == Schema Information
#
# Table name: users
#
#  id                     :integer(4)      not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer(4)      default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  role                   :string(255)
#  nom                    :string(255)
#  prenom                 :string(255)
#  actif                  :boolean(1)
#  grade_id               :integer(4)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :actif, :email, :password, :password_confirmation, :remember_me, :role, :grade_id, :nom, :prenom

  has_many :roster
  has_one :grade
  has_one :corp, :through => :grade

  ROLES = %w[compagnie section personnel]

  def roster_mission m
    Roster.find_by_user_id_and_mission_id(self.id, m)
  end

  def mongrade
    Grade.find_by_id(self.grade_id)
  end

end
