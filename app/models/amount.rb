class Amount < ApplicationRecord
  #validates :einheit
  #validates :mengen
  belongs_to :ingredient
  belongs_to :recipe
end
