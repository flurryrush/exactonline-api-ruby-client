require 'spec_helper'

describe Elmas::RevenueListByYearAndStatus do
  it "can initialize" do
    revenue_list_by_year_and_status = Elmas::RevenueListByYearAndStatus.new
    expect(revenue_list_by_year_and_status).to be_a(Elmas::RevenueListByYearAndStatus)
  end

  it "accepts attribute setter" do
    revenue_list_by_year_and_status = Elmas::RevenueListByYearAndStatus.new
    revenue_list_by_year_and_status.year = "78238"
    expect(revenue_list_by_year_and_status.year).to eq "78238"
  end

  it "returns value for getters" do
    revenue_list_by_year_and_status = Elmas::RevenueListByYearAndStatus.new({ "Year" => "345" })
    expect(revenue_list_by_year_and_status.year).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    revenue_list_by_year_and_status = Elmas::RevenueListByYearAndStatus.new({ this_does_not_exist: "Piet" })
    expect(revenue_list_by_year_and_status.try(:year)).to eq nil
  end



  let(:resource) { resource = Elmas::RevenueListByYearAndStatus.new(id: "12abcdef-1234-1234-1234-123456abcdef", year: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/financial/RevenueListByYearAndStatus(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/financial/RevenueListByYearAndStatus?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/financial/RevenueListByYearAndStatus?$filter=Year eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:year, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/financial/RevenueListByYearAndStatus?$orderby=Year&$filter=Year eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:year, :id], order_by: :year)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/financial/RevenueListByYearAndStatus?$orderby=Year")
      resource.find_all(order_by: :year)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/RevenueListByYearAndStatus?$select=Year")
      resource.find_all(select: [:year])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/financial/RevenueListByYearAndStatus?$select=Year")
      resource.find_by(select: [:year])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/RevenueListByYearAndStatus?$select=Year,ID")
      resource.find_all(select: [:year, :id])
    end
  end
end
