class ItemOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :house_num, :building_name, :phone, :item_id, :user_id, :token, :price
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'には（-）を含めてください' }
    validates :area_id,     numericality: { other_than: 1, message: '配送元の地域を選択してください' }
    validates :phone,       format: { with: /(0{1}\d{9,10})/, message: 'には半角数字のみで入力してください' }
    validates :token
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: 'には全角文字を使用してください' } do
      validates :city
      validates :house_num
    end
  end
  validates :building_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: 'には全角文字を使用してください' }, allow_blank: true

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Delivery.create(postal_code: postal_code, area_id: area_id, city: city, house_num: house_num, building_name: building_name,
                    phone: phone, order_id: order.id)
  end
end
