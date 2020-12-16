class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :products
         has_many :buys

         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])\w{6,12}\z/
         with_options presence: true do
         validates :nickname
         validates :birthday
         end
         with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/} do
         validates :first_name
         validates :last_name
         end
         with_options presence: true, format: { with: /\A[ァ-ン]+\z/} do
         validates :first_name_kana
         validates :last_name_kana
         end
         validates :password, length: { minimum: 6 },confirmation: true,format: { with: VALID_PASSWORD_REGEX }
        
end
