class Artist < ApplicationRecord
    has_many :performances
    has_many :stages, through: :performances

    validates :name, presence: true
    validates :performances, presence: true
end
