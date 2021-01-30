class Cocktail < ApplicationRecord
  has_many :doses
  has_many :ingredients, through: :doses
  # validates_associated :books

  validates :name, presence: true, uniqueness: true
end
