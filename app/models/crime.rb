class Crime < ApplicationRecord
    belongs_to :locality
    belongs_to :crime_reporter
    validates :description, presence: true, length: {minimum: 10}
    validates :crime_type, presence: true
    enum :priority, [ :low, :medium, :high ]
    validates :priority, inclusion: {in: priorities}
    validates :resolved, inclusion: { in: [true, false] }
    accepts_nested_attributes_for :crime_reporter
    accepts_nested_attributes_for :locality
end