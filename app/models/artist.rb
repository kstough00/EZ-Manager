class Artist < ApplicationRecord
    has_many :performances
    has_many :stages, through: :performances

    validates :name, presence: true
    validates :genre, presence: true
    validates :name, uniqueness: true

    def duration
        self.performances.sum do |performance|
            performance.duration
        end
    end
end
