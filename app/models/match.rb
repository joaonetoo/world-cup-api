class Match < ApplicationRecord
  belongs_to :stadium
  has_and_belongs_to_many :teams
end
