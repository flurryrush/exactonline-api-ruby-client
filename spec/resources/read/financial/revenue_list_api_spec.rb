require 'spec_helper'

describe Elmas::RevenueList do
  it "can initialize" do
    revenue_list = Elmas::RevenueList.new
    expect(revenue_list).to be_a(Elmas::RevenueList)
  end

  it "accepts attribute setter" do
    revenue_list = Elmas::RevenueList.new
    revenue_list.year = "78238"
    expect(revenue_list.year).to eq "78238"
  end

  it "returns value for getters" do
    revenue_list = Elmas::RevenueList.new({ "Year" => "345" })
    expect(revenue_list.year).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    revenue_list = Elmas::RevenueList.new({ this_does_not_exist: "Piet" })
    expect(revenue_list.try(:year)).to eq nil
  end



  let(:resource) { resource = Elmas::RevenueList.new(id: "12abcdef-1234-1234-1234-123456abcdef", year: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/financial/RevenueList(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/financial/RevenueList?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/financial/RevenueList?$filter=Year eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:year, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/financial/RevenueList?$orderby=Year&$filter=Year eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:year, :id], order_by: :year)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/financial/RevenueList?$orderby=Year")
      resource.find_all(order_by: :year)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/RevenueList?$select=Year")
      resource.find_all(select: [:year])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/financial/RevenueList?$select=Year")
      resource.find_by(select: [:year])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/RevenueList?$select=Year,ID")
      resource.find_all(select: [:year, :id])
    end
  end
end
