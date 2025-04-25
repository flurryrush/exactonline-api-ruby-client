require 'spec_helper'

describe Elmas::MailMessageAttachment do
  it "can initialize" do
    mail_message_attachment = Elmas::MailMessageAttachment.new
    expect(mail_message_attachment).to be_a(Elmas::MailMessageAttachment)
  end

  it "accepts attribute setter" do
    mail_message_attachment = Elmas::MailMessageAttachment.new
    mail_message_attachment.type = "78238"
    expect(mail_message_attachment.type).to eq "78238"
  end

  it "returns value for getters" do
    mail_message_attachment = Elmas::MailMessageAttachment.new({ "Type" => "345" })
    expect(mail_message_attachment.type).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    mail_message_attachment = Elmas::MailMessageAttachment.new({ this_does_not_exist: "Piet" })
    expect(mail_message_attachment.try(:type)).to eq nil
  end

  it "is valid with mandatory attributes" do
    mail_message_attachment = Elmas::MailMessageAttachment.new(attachment: "Attachment", attachment_file_name: "AttachmentFileName", mail_message_id: "MailMessageID")
    expect(mail_message_attachment.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    mail_message_attachment = Elmas::MailMessageAttachment.new
    expect(mail_message_attachment.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::MailMessageAttachment.new(id: "12abcdef-1234-1234-1234-123456abcdef", type: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("mailbox/MailMessageAttachments(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("mailbox/MailMessageAttachments?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("mailbox/MailMessageAttachments?$filter=Type eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:type, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("mailbox/MailMessageAttachments?$orderby=Type&$filter=Type eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:type, :id], order_by: :type)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("mailbox/MailMessageAttachments?$orderby=Type")
      resource.find_all(order_by: :type)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("mailbox/MailMessageAttachments?$select=Type")
      resource.find_all(select: [:type])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("mailbox/MailMessageAttachments?$select=Type")
      resource.find_by(select: [:type])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("mailbox/MailMessageAttachments?$select=Type,ID")
      resource.find_all(select: [:type, :id])
    end
  end
end
