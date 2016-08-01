class Contact < ActiveRecord::Base
  validates :email, :name, :user_id, presence: true
  validates :email, uniqueness: { scope: :user_id }
  belongs_to :user
end
