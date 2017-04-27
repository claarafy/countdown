class User < ApplicationRecord
  has_secure_password
  has_many :memberships, dependent: :destroy
  has_many :groups, through: :memberships
  has_many :posts, dependent: :destroy

  has_many :invitations, :class_name => "Invite", :foreign_key => 'receiver_id'
  has_many :sent_invites, :class_name => "Invite", :foreign_key => 'sender_id'

  
end
