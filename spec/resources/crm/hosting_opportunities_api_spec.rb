require 'spec_helper'

describe Elmas::HostingOpportunity do
  it "can initialize" do
    hosting_opportunity = Elmas::HostingOpportunity.new
    expect(hosting_opportunity).to be_a(Elmas::HostingOpportunity)
  end

  it "accepts attribute setter" do
    hosting_opportunity = Elmas::HostingOpportunity.new
    hosting_opportunity.close_date = "78238"
    expect(hosting_opportunity.close_date).to eq "78238"
  end

  it "returns value for getters" do
    hosting_opportunity = Elmas::HostingOpportunity.new({ "CloseDate" => "345" })
    expect(hosting_opportunity.close_date).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    hosting_opportunity = Elmas::HostingOpportunity.new({ this_does_not_exist: "Piet" })
    expect(hosting_opportunity.try(:close_date)).to eq nil
  end



  let(:resource) { resource = Elmas::HostingOpportunity.new(id: "12abcdef-1234-1234-1234-123456abcdef", close_date: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("crm/HostingOpportunities(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("crm/HostingOpportunities?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("crm/HostingOpportunities?$filter=CloseDate eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:close_date, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("crm/HostingOpportunities?$orderby=CloseDate&$filter=CloseDate eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:close_date, :id], order_by: :close_date)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("crm/HostingOpportunities?$orderby=CloseDate")
      resource.find_all(order_by: :close_date)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/HostingOpportunities?$select=CloseDate")
      resource.find_all(select: [:close_date])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("crm/HostingOpportunities?$select=CloseDate")
      resource.find_by(select: [:close_date])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/HostingOpportunities?$select=CloseDate,ID")
      resource.find_all(select: [:close_date, :id])
    end
  end
end
