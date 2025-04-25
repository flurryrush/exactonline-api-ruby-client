require 'spec_helper'

describe Elmas::AccountDocumentFolder do
  it "can initialize" do
    account_document_folder = Elmas::AccountDocumentFolder.new
    expect(account_document_folder).to be_a(Elmas::AccountDocumentFolder)
  end

  it "accepts attribute setter" do
    account_document_folder = Elmas::AccountDocumentFolder.new
    account_document_folder.share_point_id = "78238"
    expect(account_document_folder.share_point_id).to eq "78238"
  end

  it "returns value for getters" do
    account_document_folder = Elmas::AccountDocumentFolder.new({ "SharePointID" => "345" })
    expect(account_document_folder.share_point_id).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    account_document_folder = Elmas::AccountDocumentFolder.new({ this_does_not_exist: "Piet" })
    expect(account_document_folder.try(:share_point_id)).to eq nil
  end



  let(:resource) { resource = Elmas::AccountDocumentFolder.new(id: "12abcdef-1234-1234-1234-123456abcdef", share_point_id: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/crm/AccountDocumentFolders(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/crm/AccountDocumentFolders?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/crm/AccountDocumentFolders?$filter=SharePointID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:share_point_id, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/crm/AccountDocumentFolders?$orderby=SharePointID&$filter=SharePointID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:share_point_id, :id], order_by: :share_point_id)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/crm/AccountDocumentFolders?$orderby=SharePointID")
      resource.find_all(order_by: :share_point_id)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/crm/AccountDocumentFolders?$select=SharePointID")
      resource.find_all(select: [:share_point_id])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/crm/AccountDocumentFolders?$select=SharePointID")
      resource.find_by(select: [:share_point_id])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/crm/AccountDocumentFolders?$select=SharePointID,ID")
      resource.find_all(select: [:share_point_id, :id])
    end
  end
end
