class Dose < ApplicationRecord
  belongs_to :cocktails
  belongs_to :ingredients

  validates :description, presence: true
  validates :cocktail, uniqueness: { scope: :ingredient }
end
