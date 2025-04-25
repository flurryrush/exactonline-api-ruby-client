require 'spec_helper'

describe Elmas::SyncDocumentsDocumentAttachment do
  it "can initialize" do
    sync_documents_document_attachment = Elmas::SyncDocumentsDocumentAttachment.new
    expect(sync_documents_document_attachment).to be_a(Elmas::SyncDocumentsDocumentAttachment)
  end

  it "accepts attribute setter" do
    sync_documents_document_attachment = Elmas::SyncDocumentsDocumentAttachment.new
    sync_documents_document_attachment.file_size = "78238"
    expect(sync_documents_document_attachment.file_size).to eq "78238"
  end

  it "returns value for getters" do
    sync_documents_document_attachment = Elmas::SyncDocumentsDocumentAttachment.new({ "FileSize" => "345" })
    expect(sync_documents_document_attachment.file_size).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_documents_document_attachment = Elmas::SyncDocumentsDocumentAttachment.new({ this_does_not_exist: "Piet" })
    expect(sync_documents_document_attachment.try(:file_size)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sync_documents_document_attachment = Elmas::SyncDocumentsDocumentAttachment.new(attachment: "Attachment", document: "Document", file_name: "FileName")
    expect(sync_documents_document_attachment.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sync_documents_document_attachment = Elmas::SyncDocumentsDocumentAttachment.new
    expect(sync_documents_document_attachment.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SyncDocumentsDocumentAttachment.new(id: "12abcdef-1234-1234-1234-123456abcdef", file_size: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Documents/DocumentAttachments(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Documents/DocumentAttachments?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Documents/DocumentAttachments?$filter=FileSize eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:file_size, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Documents/DocumentAttachments?$orderby=FileSize&$filter=FileSize eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:file_size, :id], order_by: :file_size)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Documents/DocumentAttachments?$orderby=FileSize")
      resource.find_all(order_by: :file_size)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Documents/DocumentAttachments?$select=FileSize")
      resource.find_all(select: [:file_size])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Documents/DocumentAttachments?$select=FileSize")
      resource.find_by(select: [:file_size])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Documents/DocumentAttachments?$select=FileSize,ID")
      resource.find_all(select: [:file_size, :id])
    end
  end
end
