require 'spec_helper'

describe Elmas::SyncDocumentsDocument do
  it "can initialize" do
    sync_documents_document = Elmas::SyncDocumentsDocument.new
    expect(sync_documents_document).to be_a(Elmas::SyncDocumentsDocument)
  end

  it "accepts attribute setter" do
    sync_documents_document = Elmas::SyncDocumentsDocument.new
    sync_documents_document.account = "78238"
    expect(sync_documents_document.account).to eq "78238"
  end

  it "returns value for getters" do
    sync_documents_document = Elmas::SyncDocumentsDocument.new({ "Account" => "345" })
    expect(sync_documents_document.account).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_documents_document = Elmas::SyncDocumentsDocument.new({ this_does_not_exist: "Piet" })
    expect(sync_documents_document.try(:account)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sync_documents_document = Elmas::SyncDocumentsDocument.new(subject: "Subject", type: "Type")
    expect(sync_documents_document.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sync_documents_document = Elmas::SyncDocumentsDocument.new
    expect(sync_documents_document.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SyncDocumentsDocument.new(id: "12abcdef-1234-1234-1234-123456abcdef", account: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Documents/Documents(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Documents/Documents?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Documents/Documents?$filter=Account eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:account, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Documents/Documents?$orderby=Account&$filter=Account eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:account, :id], order_by: :account)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Documents/Documents?$orderby=Account")
      resource.find_all(order_by: :account)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Documents/Documents?$select=Account")
      resource.find_all(select: [:account])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Documents/Documents?$select=Account")
      resource.find_by(select: [:account])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Documents/Documents?$select=Account,ID")
      resource.find_all(select: [:account, :id])
    end
  end
end
