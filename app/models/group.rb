class Group < ApplicationRecord
    has_many :teams
    validates :name, presence: true, on: :create
end
