require 'spec_helper'

describe Elmas::HRMDivision do
  it "can initialize" do
    hrm_division = Elmas::HRMDivision.new
    expect(hrm_division).to be_a(Elmas::HRMDivision)
  end

  it "accepts attribute setter" do
    hrm_division = Elmas::HRMDivision.new
    hrm_division.class_01 = "78238"
    expect(hrm_division.class_01).to eq "78238"
  end

  it "returns value for getters" do
    hrm_division = Elmas::HRMDivision.new({ "Class01" => "345" })
    expect(hrm_division.class_01).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    hrm_division = Elmas::HRMDivision.new({ this_does_not_exist: "Piet" })
    expect(hrm_division.try(:class_01)).to eq nil
  end



  let(:resource) { resource = Elmas::HRMDivision.new(id: "12abcdef-1234-1234-1234-123456abcdef", class_01: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("hrm/Divisions(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("hrm/Divisions?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("hrm/Divisions?$filter=Class01 eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:class_01, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("hrm/Divisions?$orderby=Class01&$filter=Class01 eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:class_01, :id], order_by: :class_01)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("hrm/Divisions?$orderby=Class01")
      resource.find_all(order_by: :class_01)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("hrm/Divisions?$select=Class01")
      resource.find_all(select: [:class_01])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("hrm/Divisions?$select=Class01")
      resource.find_by(select: [:class_01])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("hrm/Divisions?$select=Class01,ID")
      resource.find_all(select: [:class_01, :id])
    end
  end
end
