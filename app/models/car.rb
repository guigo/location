class Car < ApplicationRecord
  enum status: { 'active' => 0, 'blocked' => 1 }

  has_many :reserved_cars

  has_one_attached :image

  validates :model,:brand, :board, :model_year, :year_manufacture, presence: true
end
