class CrimeReporter < ApplicationRecord
    has_many :crimes, dependent: :destroy
    validates :reporter, presence: true

end
  