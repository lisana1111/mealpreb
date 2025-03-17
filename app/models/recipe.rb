class Recipe < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
  has_many :amounts, dependent: :destroy
  has_many :ingredients, through: :amounts
end
