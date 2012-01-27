# == Schema Information
#
# Table name: grades
#
#  id      :integer(4)      not null, primary key
#  nom     :string(255)
#  corp_id :integer(4)
#

class Grade < ActiveRecord::Base
  belongs_to :corp
  has_many :users
end
