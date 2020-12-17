class Usernc

#   include ActiveModel::Model
#   attr_accessor :nickname, :family_name, :first_name, :family_name_reading, :first_name_reading, :birthday
  
#   with_options presence: true do
#     validates :nickname,                                                                                        presence: true      
#     validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"},            presence: true
#     validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"},             presence: true
#     validates :family_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}, presence: true
#     validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"},  presence: true
#     validates :birthday,                                                                                       presence: true
#   end           

#   def save
#     # ユーザーの情報を保存し、「user」という変数に入れている
#     user = User.create(nickname: nickname, family_name: family_name, first_name: first_name, family_name_reading: family_name_reading, first_name_reading: first_name_reading, birthday: birthday)

#   end
end