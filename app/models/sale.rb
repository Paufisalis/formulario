class Sale < ApplicationRecord
  validates :cod, uniqueness: true
  validates :detail, presence: true
  validates_inclusion_of :category, :in => [1, 2, 3, 4 ,5]
  validates:value, numericality: { only_integer: true, grater_than_or_equal_to: 0, message: "%{value} is not a valid size" }
  validates :discount, numericality: { only_integer: true, grater_than_or_equal_to: 0, less_than_or_equal_to: 40, message: "%{value} is not a valid size" }
end
