require 'spec_helper'

describe Elmas::CRMDocument do
  it "can initialize" do
    crm_document = Elmas::CRMDocument.new
    expect(crm_document).to be_a(Elmas::CRMDocument)
  end

  it "accepts attribute setter" do
    crm_document = Elmas::CRMDocument.new
    crm_document.document_folder = "78238"
    expect(crm_document.document_folder).to eq "78238"
  end

  it "returns value for getters" do
    crm_document = Elmas::CRMDocument.new({ "DocumentFolder" => "345" })
    expect(crm_document.document_folder).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    crm_document = Elmas::CRMDocument.new({ this_does_not_exist: "Piet" })
    expect(crm_document.try(:document_folder)).to eq nil
  end



  let(:resource) { resource = Elmas::CRMDocument.new(id: "12abcdef-1234-1234-1234-123456abcdef", document_folder: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/crm/Documents(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/crm/Documents?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/crm/Documents?$filter=DocumentFolder eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:document_folder, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/crm/Documents?$orderby=DocumentFolder&$filter=DocumentFolder eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:document_folder, :id], order_by: :document_folder)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/crm/Documents?$orderby=DocumentFolder")
      resource.find_all(order_by: :document_folder)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/crm/Documents?$select=DocumentFolder")
      resource.find_all(select: [:document_folder])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/crm/Documents?$select=DocumentFolder")
      resource.find_by(select: [:document_folder])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/crm/Documents?$select=DocumentFolder,ID")
      resource.find_all(select: [:document_folder, :id])
    end
  end
end
