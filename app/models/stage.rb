class Stage < ApplicationRecord
    has_many :performances
    has_many :artists, through: :performances

    validates :name, presence: true
    validates :performances, presence: true
    validates :name, uniqueness: true
end
