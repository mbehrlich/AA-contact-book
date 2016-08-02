class Group < ActiveRecord::Base

  belongs_to :user
  has_many :group_contacts
  has_many :contacts, through: :group_contacts

  def add(contact)
    gc = GroupContact.new(group_id: id, contact_id: contact.id)
    gc.save
  end

end
