class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # 検索可能な属性をリストとして定義します
  def self.ransackable_attributes(auth_object = nil)
    ["email", "created_at", "updated_at", "reset_password_token" ,"reset_password_sent_at", "name"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["posts"] # 関連を検索不可に設定
  end
end
