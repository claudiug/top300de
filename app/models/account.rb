class Account < ActiveRecord::Base
  has_one :mailbox
  has_many :messages

  def message_count
    messages.size
  end
end
