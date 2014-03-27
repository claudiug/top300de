class SendDirection < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.send_direction.send_link_with_direction.subject
  #
  def send_link_with_direction(params)
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
