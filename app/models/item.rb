class Item < ApplicationRecord
  validates :name,                presence: true
  validates :text,                presence: true
  validates :category_id,         presence: true, numericality: { other_than: 1, message: 'を選択してください' }
  validates :condition_id,        presence: true, numericality: { other_than: 1, message: 'を選択してください' }
  validates :delivery_charge_id,  presence: true, numericality: { other_than: 1, message: 'を選択してください' }
  validates :prefecture_id,       presence: true, numericality: { other_than: 1, message: 'を選択してください' }
  validates :days_to_delivery_id, presence: true, numericality: { other_than: 1, message: 'を選択してください' }
  validates :price,               presence: true,
                                  format: { with: /\A[0-9]+\Z/ },
                                  numericality: { less_than_or_equal_to: 9_999_999, greater_than_or_equal_to: 300,
                                                  message: 'は300〜9,999,999円の範囲で半角数字で入力してください' }
  validates :user,                presence: true
  validates :image,               presence: true

  belongs_to :user
  has_one_attached :image
  has_one :purchase_record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :delivery_charge
  belongs_to :days_to_delivery
end
