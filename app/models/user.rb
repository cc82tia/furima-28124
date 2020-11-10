class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         VALID_READING_REGEX = /\A[ァ-ヶー－]+\z/
         VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
         VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])\w{6,}\z/
         validates :password, presence: true,
                   format: { with: VALID_PASSWORD_REGEX,
                    message: "は半角6文字以上の英文字・数字それぞれ１文字以上含む必要があります"}
  with_options presence: true do
    validates :nickname,                                                                                        presence: true      
    validates :family_name, format: { with: VALID_NAME_REGEX, message: "は全角で入力してください。"},            presence: true
    validates :first_name, format: { with: VALID_NAME_REGEX, message: "は全角で入力してください。"},             presence: true
    validates :family_name_reading, format: { with: VALID_READING_REGEX, message: "は全角カタカナで入力して下さい。"}, presence: true
    validates :first_name_reading, format: { with: VALID_READING_REGEX, message: "は全角カタカナで入力して下さい。"},  presence: true
    validates :birthday,                                                                                       presence: true
  end           
end


