class Stage < ApplicationRecord
    has_many :artists, through: :performances
end
