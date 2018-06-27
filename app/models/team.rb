class Team < ApplicationRecord
  searchkick
  belongs_to :group
  has_and_belongs_to_many :matches
  has_many :players, dependent: :destroy
  validates_presence_of :group
  validates :name, :code, presence: true, :on => :create
end
