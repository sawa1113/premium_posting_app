class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 検索可能な属性をリストとして定義します
  def self.ransackable_attributes(auth_object = nil)
    ["email", "created_at", "updated_at", "reset_password_sent_at", "name"]
  end
end
