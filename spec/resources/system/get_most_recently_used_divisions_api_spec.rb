require 'spec_helper'

describe Elmas::GetMostRecentlyUsedDivision do
  it "can initialize" do
    get_most_recently_used_division = Elmas::GetMostRecentlyUsedDivision.new
    expect(get_most_recently_used_division).to be_a(Elmas::GetMostRecentlyUsedDivision)
  end

  it "accepts attribute setter" do
    get_most_recently_used_division = Elmas::GetMostRecentlyUsedDivision.new
    get_most_recently_used_division.chamber_of_commerce_number = "78238"
    expect(get_most_recently_used_division.chamber_of_commerce_number).to eq "78238"
  end

  it "returns value for getters" do
    get_most_recently_used_division = Elmas::GetMostRecentlyUsedDivision.new({ "ChamberOfCommerceNumber" => "345" })
    expect(get_most_recently_used_division.chamber_of_commerce_number).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    get_most_recently_used_division = Elmas::GetMostRecentlyUsedDivision.new({ this_does_not_exist: "Piet" })
    expect(get_most_recently_used_division.try(:chamber_of_commerce_number)).to eq nil
  end



  let(:resource) { resource = Elmas::GetMostRecentlyUsedDivision.new(id: "12abcdef-1234-1234-1234-123456abcdef", chamber_of_commerce_number: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("system/GetMostRecentlyUsedDivisions(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("system/GetMostRecentlyUsedDivisions?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("system/GetMostRecentlyUsedDivisions?$filter=ChamberOfCommerceNumber eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:chamber_of_commerce_number, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("system/GetMostRecentlyUsedDivisions?$orderby=ChamberOfCommerceNumber&$filter=ChamberOfCommerceNumber eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:chamber_of_commerce_number, :id], order_by: :chamber_of_commerce_number)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("system/GetMostRecentlyUsedDivisions?$orderby=ChamberOfCommerceNumber")
      resource.find_all(order_by: :chamber_of_commerce_number)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("system/GetMostRecentlyUsedDivisions?$select=ChamberOfCommerceNumber")
      resource.find_all(select: [:chamber_of_commerce_number])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("system/GetMostRecentlyUsedDivisions?$select=ChamberOfCommerceNumber")
      resource.find_by(select: [:chamber_of_commerce_number])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("system/GetMostRecentlyUsedDivisions?$select=ChamberOfCommerceNumber,ID")
      resource.find_all(select: [:chamber_of_commerce_number, :id])
    end
  end
end
