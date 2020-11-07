class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname,  format:{ with: /\A[a-z0-9]+\z/i, message: "Nicknameを入力してください, Nicknameは半角英数で入力してください。"}, presence: true      
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}, presence: true
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}, presence: true
    validates :family_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}, presence: true
    validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}, presence: true
    validates :birthday, presence: true
  end
end
