class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 認証メソッドの明示的な定義
  def self.authenticate_admin_user!(email, password)
    admin_user = find_by(email: email)
    return admin_user if admin_user&.valid_password?(password)

    false
  end

  # 検索可能な属性をリストとして定義します
  def self.ransackable_attributes(auth_object = nil)
    ["email", "created_at", "updated_at", "reset_password_sent_at", "name"]
  end
end
