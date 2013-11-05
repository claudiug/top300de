class Message < ActiveRecord::Base
  belongs_to :mailbox


  def get_owner
    mailbox.name.titlecase
  end


end
