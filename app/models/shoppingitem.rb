class ShoppingItem < ApplicationRecord
  belongs_to :weeklyplaner

  # attributes: name (string), einheit (string), total_menge (float), done (boolean)
end
