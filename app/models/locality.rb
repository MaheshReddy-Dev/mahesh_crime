class Locality < ApplicationRecord
  belongs_to :city
  has_many :crimes,  dependent: :destroy
  validates :locality, presence: true
end
