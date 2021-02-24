class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :burden
  belongs_to :area
  belongs_to :days

  validates :product_name, presence: true
  validates :price,        presence: true
  validates :description,  presence: true

  validates :category_id,       numericality: {other_than: 1 }
  validates :product_status_id, numericality: {other_than: 1 }
  validates :burden_id,         numericality: {other_than: 1 }
  validates :area_id,           numericality: {other_than: 1 }
  validates :days_id,           numericality: {other_than: 1 }
end
