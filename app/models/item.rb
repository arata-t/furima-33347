class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :burden
  belongs_to :area
  belongs_to :days

  validates :product_name, presence: { message: '名前を入力してください' }
  validates :description,  presence: { message: '商品の説明を入力してください' }
  validates :image,        presence: { message: '画像を添付してください' }

  validates :category_id,       numericality: { other_than: 1, message: 'カテゴリーを選択してください' }
  validates :product_status_id, numericality: { other_than: 1, message: '商品の状態を選択してください' }
  validates :burden_id,         numericality: { other_than: 1, message: '配送料の負担を選択してください' }
  validates :area_id,           numericality: { other_than: 1, message: '配送元の地域を選択してください' }
  validates :days_id,           numericality: { other_than: 1, message: '配送までの日数を選択してください' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: '販売価格は¥300~¥9,999,999としてください' }

  with_options presence: true do
    validates :price, numericality: { only_integer: true, message: 'is invalid. 販売価格は半角数字としてください' }
  end
end
