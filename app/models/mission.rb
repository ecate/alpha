# == Schema Information
#
# Table name: missions
#
#  id            :integer(4)      not null, primary key
#  name          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  code_activite :integer(4)
#

class Mission < ActiveRecord::Base
  has_many :convocationjours
  has_many :rosters

  has_many :jours, :through => :rosters
  has_many :users, :through => :rosters

  attr_accessible :name, :code_activite
  accepts_nested_attributes_for :convocationjours


  def debutannee
    self.convocationjours.sort_by(&:jourconvoc).first.jourconvoc.year

  end

  def finannee
    self.convocationjours.sort_by(&:jourconvoc).last.jourconvoc.year

  end

  def debutmois
    self.convocationjours.sort_by(&:jourconvoc).first.jourconvoc.strftime("%B")

  end

  def finmois
    self.convocationjours.sort_by(&:jourconvoc).last.jourconvoc.strftime("%B")

  end

  def debutjour
    self.convocationjours.sort_by(&:jourconvoc).first.jourconvoc.day

  end

  def finjour
    self.convocationjours.sort_by(&:jourconvoc).last.jourconvoc.day

  end
end
