require 'spec_helper'

describe Elmas::OpportunityDocument do
  it "can initialize" do
    opportunity_document = Elmas::OpportunityDocument.new
    expect(opportunity_document).to be_a(Elmas::OpportunityDocument)
  end

  it "accepts attribute setter" do
    opportunity_document = Elmas::OpportunityDocument.new
    opportunity_document.created = "78238"
    expect(opportunity_document.created).to eq "78238"
  end

  it "returns value for getters" do
    opportunity_document = Elmas::OpportunityDocument.new({ "Created" => "345" })
    expect(opportunity_document.created).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    opportunity_document = Elmas::OpportunityDocument.new({ this_does_not_exist: "Piet" })
    expect(opportunity_document.try(:created)).to eq nil
  end



  let(:resource) { resource = Elmas::OpportunityDocument.new(id: "12abcdef-1234-1234-1234-123456abcdef", created: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/crm/OpportunityDocuments(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/crm/OpportunityDocuments?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/crm/OpportunityDocuments?$filter=Created eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:created, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/crm/OpportunityDocuments?$orderby=Created&$filter=Created eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:created, :id], order_by: :created)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/crm/OpportunityDocuments?$orderby=Created")
      resource.find_all(order_by: :created)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/crm/OpportunityDocuments?$select=Created")
      resource.find_all(select: [:created])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/crm/OpportunityDocuments?$select=Created")
      resource.find_by(select: [:created])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/crm/OpportunityDocuments?$select=Created,ID")
      resource.find_all(select: [:created, :id])
    end
  end
end
