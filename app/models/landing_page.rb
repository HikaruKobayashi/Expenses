class LandingPage < ApplicationRecord
  has_many :income
  accepts_nested_attributes_for :income
end