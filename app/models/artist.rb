class Artist < ApplicationRecord
    has_many :performances
    has_many :stages, through: :performances
end
