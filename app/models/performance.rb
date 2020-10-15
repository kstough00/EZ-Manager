class Performance < ApplicationRecord
    belongs_to :stage
    belongs_to :artist
    validates_presence_of :duration
end
