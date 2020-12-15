class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :products
         has_many :buys

         VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])\w{6,12}\z/
         /\A[ぁ-んァ-ン一-龥]+\z/
         validates :nickname, presence: true
         with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/} do
         validates :first_name, presence: true
         validates :last_name, presence: true
         end
         with_options presence: true, format: { with: /\A[ァ-ン]+\z/} do
         validates :first_name_kana, presence: true
         validates :last_name_kana, presence: true
         end
         validates :birthday, presence: true
         validates :password, length: { minimum: 6 },confirmation: true,format: { with: VALID_PASSWORD_REGEX }
         validates :email, uniqueness: true
end
