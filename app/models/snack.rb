class Snack < ApplicationRecord
  has_many :machine_snacks
  has_many :machine, through: :machine_snacks
end
