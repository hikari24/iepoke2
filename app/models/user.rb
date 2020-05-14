class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :foods, dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :name, presence: true

  #ログイン時のバリデーション
  def active_for_authentication?
    super && (self.status == true)
  end
end
