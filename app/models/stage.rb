class Stage < ApplicationRecord
    has_many :performances
    has_many :artists, through: :performances
end
