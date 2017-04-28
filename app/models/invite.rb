class Invite < ApplicationRecord
  belongs_to :group

  belongs_to :sender, :class_name => 'User'
  belongs_to :receiver, :class_name => 'User'

  after_validation :log_errors, :if => Proc.new {|m| m.errors}

  def log_errors
    Rails.logger.debug self.errors.full_messages.join("\n")
  end

end
