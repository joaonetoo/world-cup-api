class Team < ApplicationRecord
  belongs_to :group
  has_and_belongs_to_many :matches
  has_many :players, dependent: :destroy
end
