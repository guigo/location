class Car < ApplicationRecord
  enum status: { 'active' => 0, 'blocked' => 1 }
  
  has_one_attached :image
end
