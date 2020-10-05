class ReservedCar < ApplicationRecord
  belongs_to :car
  belongs_to :user

  validates :document, :start_at, :and_at, presence: true
end
