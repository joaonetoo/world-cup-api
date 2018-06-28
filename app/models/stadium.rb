class Stadium < ApplicationRecord
    has_many :matches
    validates :name,:city, presence: true, on: :create
end
