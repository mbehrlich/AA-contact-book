class Contact < ActiveRecord::Base
  validates :email, :name, :user_id, presence: true
  validates :email, uniqueness: { scope: :user_id }

  belongs_to :owner,
  class_name: :User,
  foreign_key: :user_id

  has_many :contact_shares, dependent: :destroy

  has_many :shared_users,
  through: :contact_shares,
  source: :user

  has_many :comments, as: :ref

end
