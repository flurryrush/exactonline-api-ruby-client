require 'spec_helper'

describe Elmas::Opportunity do
  it "can initialize" do
    opportunity = Elmas::Opportunity.new
    expect(opportunity).to be_a(Elmas::Opportunity)
  end

  it "accepts attribute setter" do
    opportunity = Elmas::Opportunity.new
    opportunity.amount_dc = "78238"
    expect(opportunity.amount_dc).to eq "78238"
  end

  it "returns value for getters" do
    opportunity = Elmas::Opportunity.new({ "AmountDC" => "345" })
    expect(opportunity.amount_dc).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    opportunity = Elmas::Opportunity.new({ this_does_not_exist: "Piet" })
    expect(opportunity.try(:amount_dc)).to eq nil
  end



  let(:resource) { resource = Elmas::Opportunity.new(id: "12abcdef-1234-1234-1234-123456abcdef", amount_dc: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("crm/Opportunities(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("crm/Opportunities?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("crm/Opportunities?$filter=AmountDC eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:amount_dc, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("crm/Opportunities?$orderby=AmountDC&$filter=AmountDC eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:amount_dc, :id], order_by: :amount_dc)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("crm/Opportunities?$orderby=AmountDC")
      resource.find_all(order_by: :amount_dc)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/Opportunities?$select=AmountDC")
      resource.find_all(select: [:amount_dc])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("crm/Opportunities?$select=AmountDC")
      resource.find_by(select: [:amount_dc])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/Opportunities?$select=AmountDC,ID")
      resource.find_all(select: [:amount_dc, :id])
    end
  end
end
