# == Schema Information
#
# Table name: corps
#
#  id  :integer(4)      not null, primary key
#  nom :string(255)
#

class Corp < ActiveRecord::Base
  has_many :grades
  has_many :users, :through => :grades
end
