require 'spec_helper'

describe Elmas::DocumentsAttachment do
  it "can initialize" do
    documents_attachment = Elmas::DocumentsAttachment.new
    expect(documents_attachment).to be_a(Elmas::DocumentsAttachment)
  end

  it "accepts attribute setter" do
    documents_attachment = Elmas::DocumentsAttachment.new
    documents_attachment.attachment_url = "78238"
    expect(documents_attachment.attachment_url).to eq "78238"
  end

  it "returns value for getters" do
    documents_attachment = Elmas::DocumentsAttachment.new({ "AttachmentUrl" => "345" })
    expect(documents_attachment.attachment_url).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    documents_attachment = Elmas::DocumentsAttachment.new({ this_does_not_exist: "Piet" })
    expect(documents_attachment.try(:attachment_url)).to eq nil
  end



  let(:resource) { resource = Elmas::DocumentsAttachment.new(id: "12abcdef-1234-1234-1234-123456abcdef", attachment_url: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/crm/DocumentsAttachments(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/crm/DocumentsAttachments?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/crm/DocumentsAttachments?$filter=AttachmentUrl eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:attachment_url, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/crm/DocumentsAttachments?$orderby=AttachmentUrl&$filter=AttachmentUrl eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:attachment_url, :id], order_by: :attachment_url)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/crm/DocumentsAttachments?$orderby=AttachmentUrl")
      resource.find_all(order_by: :attachment_url)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/crm/DocumentsAttachments?$select=AttachmentUrl")
      resource.find_all(select: [:attachment_url])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/crm/DocumentsAttachments?$select=AttachmentUrl")
      resource.find_by(select: [:attachment_url])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/crm/DocumentsAttachments?$select=AttachmentUrl,ID")
      resource.find_all(select: [:attachment_url, :id])
    end
  end
end
