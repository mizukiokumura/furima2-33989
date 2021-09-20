class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buys
  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :first_name, format: { with: /\A[あ-んァ-ンー-龥]/, message: "is invalid. Input full-width characters."}
    validates :last_name,  format: { with: /\A[あ-んァ-ンー-龥]/, message: "is invalid. Input full-width characters."}
    validates :kana_f_name, format: { with: /\A[ァ-ヶー-]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :kana_l_name, format: { with: /\A[ァ-ヶー-]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Input half-width characters.' }
  end
end
