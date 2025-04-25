require 'spec_helper'

describe Elmas::LeadPurpose do
  it "can initialize" do
    lead_purpose = Elmas::LeadPurpose.new
    expect(lead_purpose).to be_a(Elmas::LeadPurpose)
  end

  it "accepts attribute setter" do
    lead_purpose = Elmas::LeadPurpose.new
    lead_purpose.description = "78238"
    expect(lead_purpose.description).to eq "78238"
  end

  it "returns value for getters" do
    lead_purpose = Elmas::LeadPurpose.new({ "Description" => "345" })
    expect(lead_purpose.description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    lead_purpose = Elmas::LeadPurpose.new({ this_does_not_exist: "Piet" })
    expect(lead_purpose.try(:description)).to eq nil
  end



  let(:resource) { resource = Elmas::LeadPurpose.new(id: "12abcdef-1234-1234-1234-123456abcdef", description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("crm/LeadPurposes(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("crm/LeadPurposes?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("crm/LeadPurposes?$filter=Description eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("crm/LeadPurposes?$orderby=Description&$filter=Description eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:description, :id], order_by: :description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("crm/LeadPurposes?$orderby=Description")
      resource.find_all(order_by: :description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/LeadPurposes?$select=Description")
      resource.find_all(select: [:description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("crm/LeadPurposes?$select=Description")
      resource.find_by(select: [:description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/LeadPurposes?$select=Description,ID")
      resource.find_all(select: [:description, :id])
    end
  end
end
