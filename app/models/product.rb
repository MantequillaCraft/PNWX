class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :category

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :stock, presence: true
  validates :image, presence: true
  
end
