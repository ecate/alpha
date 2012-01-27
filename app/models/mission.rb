# == Schema Information
#
# Table name: missions
#
#  id            :integer(4)      not null, primary key
#  name          :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  code_activite :integer(4)
#  encours       :boolean(1)
#  description   :text
#

class Mission < ActiveRecord::Base
  has_many :convocationjours
  has_many :rosters

  has_many :jours, :through => :rosters
  has_many :users, :through => :rosters

  accepts_nested_attributes_for :convocationjours, :reject_if => lambda { |a| a.all? { |key, value| value.blank? } }, :allow_destroy => true
  attr_accessible :name, :code_activite, :encours, :convocationjours_attributes, :convocationjours, :description


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
  def with_blank_convocationjours(n = 4)
      n.times do
        convocationjours.build
      end
      return self
    end


end

