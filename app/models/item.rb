class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :product_name, presence: true
  validates :price,        presence: true
  validates :description,  presence: true

  validates :category_id,  numericality: {other_than: 1 }
end
