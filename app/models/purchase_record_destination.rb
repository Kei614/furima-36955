class PurchaseRecordDestination
  include ActiveModel::Model 
  attr_accessor :item_id, :user_id, :zip_code, :prefecture_id, :city,:address, :building, :telephone_number, :hoge
  
  # バリデーション
  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は、ハイフンを含めて記載してください"}
    validates :prefecture_id, numericality: {other_than: 1, message: "を選択してください"}
    validates :city
    validates :address
    validates :telephone_number,format:{ with:/\A[0-9]+\z/,message: "は、数字のみで入力してください"},length: { in: 10..11}
  end

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id,user_id: user_id)
    Destination.create(zip_code: zip_code,prefecture_id: prefecture_id,city: city,address: address,building: building,telephone_number: telephone_number,purchase_record_id: purchase_record.id)
  end

end