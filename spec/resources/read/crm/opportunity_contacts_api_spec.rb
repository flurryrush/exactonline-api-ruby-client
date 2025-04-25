require 'spec_helper'

describe Elmas::OpportunityContact do
  it "can initialize" do
    opportunity_contact = Elmas::OpportunityContact.new
    expect(opportunity_contact).to be_a(Elmas::OpportunityContact)
  end

  it "accepts attribute setter" do
    opportunity_contact = Elmas::OpportunityContact.new
    opportunity_contact.lead_source = "78238"
    expect(opportunity_contact.lead_source).to eq "78238"
  end

  it "returns value for getters" do
    opportunity_contact = Elmas::OpportunityContact.new({ "LeadSource" => "345" })
    expect(opportunity_contact.lead_source).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    opportunity_contact = Elmas::OpportunityContact.new({ this_does_not_exist: "Piet" })
    expect(opportunity_contact.try(:lead_source)).to eq nil
  end

  it "is valid with mandatory attributes" do
    opportunity_contact = Elmas::OpportunityContact.new(account: "Account", first_name: "FirstName", last_name: "LastName")
    expect(opportunity_contact.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    opportunity_contact = Elmas::OpportunityContact.new
    expect(opportunity_contact.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::OpportunityContact.new(id: "12abcdef-1234-1234-1234-123456abcdef", lead_source: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/crm/OpportunityContacts(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/crm/OpportunityContacts?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/crm/OpportunityContacts?$filter=LeadSource eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:lead_source, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/crm/OpportunityContacts?$orderby=LeadSource&$filter=LeadSource eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:lead_source, :id], order_by: :lead_source)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/crm/OpportunityContacts?$orderby=LeadSource")
      resource.find_all(order_by: :lead_source)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/crm/OpportunityContacts?$select=LeadSource")
      resource.find_all(select: [:lead_source])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/crm/OpportunityContacts?$select=LeadSource")
      resource.find_by(select: [:lead_source])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/crm/OpportunityContacts?$select=LeadSource,ID")
      resource.find_all(select: [:lead_source, :id])
    end
  end
end
