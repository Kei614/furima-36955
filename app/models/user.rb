class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates :first_name,         presence: true, format: { with: NAME_REGEX, message: 'は全角(漢字、ひらがな、カタカナ)で入力してください' }
  validates :last_name,          presence: true, format: { with: NAME_REGEX, message: 'は全角(漢字、ひらがな、カタカナ)で入力してください' }
  NAME_KANA_REGEX = /\A[ァ-ヶー]+\z/
  validates :first_name_in_kana, presence: true, format: { with: NAME_KANA_REGEX, message: 'はカタカナ(全角)で入力してください' }
  validates :last_name_in_kana,  presence: true, format: { with: NAME_KANA_REGEX, message: 'はカタカナ(全角)で入力してください' }
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX, message: 'には英数字のみ使用し、英数字の両方を含むようにしてください' }
  validates :date_of_birth,      presence: true
end
