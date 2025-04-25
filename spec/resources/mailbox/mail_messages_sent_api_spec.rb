require 'spec_helper'

describe Elmas::MailMessagesSent do
  it "can initialize" do
    mail_messages_sent = Elmas::MailMessagesSent.new
    expect(mail_messages_sent).to be_a(Elmas::MailMessagesSent)
  end

  it "accepts attribute setter" do
    mail_messages_sent = Elmas::MailMessagesSent.new
    mail_messages_sent.sender_ip_address = "78238"
    expect(mail_messages_sent.sender_ip_address).to eq "78238"
  end

  it "returns value for getters" do
    mail_messages_sent = Elmas::MailMessagesSent.new({ "SenderIpAddress" => "345" })
    expect(mail_messages_sent.sender_ip_address).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    mail_messages_sent = Elmas::MailMessagesSent.new({ this_does_not_exist: "Piet" })
    expect(mail_messages_sent.try(:sender_ip_address)).to eq nil
  end

  it "is valid with mandatory attributes" do
    mail_messages_sent = Elmas::MailMessagesSent.new(recipient_mailbox_id: "RecipientMailboxID", sender_mailbox_id: "SenderMailboxID", subject: "Subject")
    expect(mail_messages_sent.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    mail_messages_sent = Elmas::MailMessagesSent.new
    expect(mail_messages_sent.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::MailMessagesSent.new(id: "12abcdef-1234-1234-1234-123456abcdef", sender_ip_address: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("mailbox/MailMessagesSent(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("mailbox/MailMessagesSent?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("mailbox/MailMessagesSent?$filter=SenderIpAddress eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:sender_ip_address, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("mailbox/MailMessagesSent?$orderby=SenderIpAddress&$filter=SenderIpAddress eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:sender_ip_address, :id], order_by: :sender_ip_address)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("mailbox/MailMessagesSent?$orderby=SenderIpAddress")
      resource.find_all(order_by: :sender_ip_address)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("mailbox/MailMessagesSent?$select=SenderIpAddress")
      resource.find_all(select: [:sender_ip_address])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("mailbox/MailMessagesSent?$select=SenderIpAddress")
      resource.find_by(select: [:sender_ip_address])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("mailbox/MailMessagesSent?$select=SenderIpAddress,ID")
      resource.find_all(select: [:sender_ip_address, :id])
    end
  end
end
