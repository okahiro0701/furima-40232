class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :family_name, presence: true, format: {
          with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,
          message: 'は全角で必ず入力する必要があります'
        },on: :create
         validates :first_name, presence: true, format: {
          with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,
          message: 'は全角で必ず入力する必要があります'
        },on: :create
         validates :family_name_kana, presence: true, format: {
          with: /\A[ァ-ヶー－]+\z/,
          message: 'は全角のカタカナで必ず入力する必要があります'
        },on: :create
         validates :first_name_kana, presence: true, format: {
          with: /\A[ァ-ヶー－]+\z/,
          message: 'は全角のカタカナで必ず入力する必要があります'
        },on: :create
         validates :birth_date, presence: true
         validates :password, format: {
    with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,
    message: 'は半角英数字の混合である必要があります'
  },on: :create
end
