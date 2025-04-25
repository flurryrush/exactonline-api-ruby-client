require 'spec_helper'

describe Elmas::AgingPayablesList do
  it "can initialize" do
    aging_payables_list = Elmas::AgingPayablesList.new
    expect(aging_payables_list).to be_a(Elmas::AgingPayablesList)
  end

  it "accepts attribute setter" do
    aging_payables_list = Elmas::AgingPayablesList.new
    aging_payables_list.age_group4 = "78238"
    expect(aging_payables_list.age_group4).to eq "78238"
  end

  it "returns value for getters" do
    aging_payables_list = Elmas::AgingPayablesList.new({ "AgeGroup4" => "345" })
    expect(aging_payables_list.age_group4).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    aging_payables_list = Elmas::AgingPayablesList.new({ this_does_not_exist: "Piet" })
    expect(aging_payables_list.try(:age_group4)).to eq nil
  end



  let(:resource) { resource = Elmas::AgingPayablesList.new(id: "12abcdef-1234-1234-1234-123456abcdef", age_group4: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/financial/AgingPayablesList(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/financial/AgingPayablesList?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/financial/AgingPayablesList?$filter=AgeGroup4 eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:age_group4, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/financial/AgingPayablesList?$orderby=AgeGroup4&$filter=AgeGroup4 eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:age_group4, :id], order_by: :age_group4)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/financial/AgingPayablesList?$orderby=AgeGroup4")
      resource.find_all(order_by: :age_group4)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/AgingPayablesList?$select=AgeGroup4")
      resource.find_all(select: [:age_group4])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/financial/AgingPayablesList?$select=AgeGroup4")
      resource.find_by(select: [:age_group4])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/AgingPayablesList?$select=AgeGroup4,ID")
      resource.find_all(select: [:age_group4, :id])
    end
  end
end
