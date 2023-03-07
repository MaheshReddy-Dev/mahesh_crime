class City < ApplicationRecord
    has_many :localities , dependent: :destroy
    has_many :crimes, through: :localities ,  dependent: :destroy
    validates :city, presence: true
  end
  