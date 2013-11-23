class Mailbox < ActiveRecord::Base
  belongs_to :account
  has_many :messages

  def count_messages
    messages.size
  end

  def count_message_from_user(user)
     messages.where(from: "#{user}").size
  end
end
