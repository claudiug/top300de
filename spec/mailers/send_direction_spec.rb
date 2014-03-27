require "spec_helper"

describe SendDirection do
  describe "send_link_with_direction" do
    let(:mail) { SendDirection.send_link_with_direction }

    it "renders the headers" do
      mail.subject.should eq("Send link with direction")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
