require 'spec_helper'

describe Elmas::BulkDocumentsDocument do
  it "can initialize" do
    bulk_documents_document = Elmas::BulkDocumentsDocument.new
    expect(bulk_documents_document).to be_a(Elmas::BulkDocumentsDocument)
  end

  it "accepts attribute setter" do
    bulk_documents_document = Elmas::BulkDocumentsDocument.new
    bulk_documents_document.teams_meeting_id = "78238"
    expect(bulk_documents_document.teams_meeting_id).to eq "78238"
  end

  it "returns value for getters" do
    bulk_documents_document = Elmas::BulkDocumentsDocument.new({ "TeamsMeetingID" => "345" })
    expect(bulk_documents_document.teams_meeting_id).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    bulk_documents_document = Elmas::BulkDocumentsDocument.new({ this_does_not_exist: "Piet" })
    expect(bulk_documents_document.try(:teams_meeting_id)).to eq nil
  end

  it "is valid with mandatory attributes" do
    bulk_documents_document = Elmas::BulkDocumentsDocument.new(subject: "Subject", type: "Type")
    expect(bulk_documents_document.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    bulk_documents_document = Elmas::BulkDocumentsDocument.new
    expect(bulk_documents_document.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::BulkDocumentsDocument.new(id: "12abcdef-1234-1234-1234-123456abcdef", teams_meeting_id: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("bulk/Documents/Documents(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("bulk/Documents/Documents?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("bulk/Documents/Documents?$filter=TeamsMeetingID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:teams_meeting_id, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("bulk/Documents/Documents?$orderby=TeamsMeetingID&$filter=TeamsMeetingID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:teams_meeting_id, :id], order_by: :teams_meeting_id)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("bulk/Documents/Documents?$orderby=TeamsMeetingID")
      resource.find_all(order_by: :teams_meeting_id)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/Documents/Documents?$select=TeamsMeetingID")
      resource.find_all(select: [:teams_meeting_id])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("bulk/Documents/Documents?$select=TeamsMeetingID")
      resource.find_by(select: [:teams_meeting_id])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/Documents/Documents?$select=TeamsMeetingID,ID")
      resource.find_all(select: [:teams_meeting_id, :id])
    end
  end
end
