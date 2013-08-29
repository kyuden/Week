require "spec_helper"

describe NoticeMailer do
  describe "cart_notice" do
    let(:mail) { NoticeMailer.cart_notice }

    it "renders the headers" do
      mail.subject.should eq("Cart notice")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
