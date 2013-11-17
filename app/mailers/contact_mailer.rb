class ContactMailer < ActionMailer::Base
  default from: "from@example.com"

  def feedback_user(feedback)
    @feedback = feedback
    @feedback[0]
    @feedback[1]
    @feedback[2]


  end
end
