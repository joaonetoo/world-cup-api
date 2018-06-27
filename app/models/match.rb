class Match < ApplicationRecord
  belongs_to :stadium
  has_and_belongs_to_many :teams
  accepts_nested_attributes_for :teams

end
