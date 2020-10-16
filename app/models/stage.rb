class Stage < ApplicationRecord
    has_many :performances
    has_many :artists, through: :performances
    scope :large, -> { where('capacity > 500') }
    scope :small, -> { where('capacity < 500') }

    #would it be easier to build a scope method that just orders stages in order of highest to lowest capacity?

    validates :name, presence: true
    validates :name, uniqueness: true


end
