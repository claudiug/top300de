class Account < ActiveRecord::Base
  has_one :mailbox
end
