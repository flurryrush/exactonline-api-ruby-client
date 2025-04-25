require 'spec_helper'

describe Elmas::AgingPayablesListByAgeGroup do
  it "can initialize" do
    aging_payables_list_by_age_group = Elmas::AgingPayablesListByAgeGroup.new
    expect(aging_payables_list_by_age_group).to be_a(Elmas::AgingPayablesListByAgeGroup)
  end

  it "accepts attribute setter" do
    aging_payables_list_by_age_group = Elmas::AgingPayablesListByAgeGroup.new
    aging_payables_list_by_age_group.age_group4_amount = "78238"
    expect(aging_payables_list_by_age_group.age_group4_amount).to eq "78238"
  end

  it "returns value for getters" do
    aging_payables_list_by_age_group = Elmas::AgingPayablesListByAgeGroup.new({ "AgeGroup4Amount" => "345" })
    expect(aging_payables_list_by_age_group.age_group4_amount).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    aging_payables_list_by_age_group = Elmas::AgingPayablesListByAgeGroup.new({ this_does_not_exist: "Piet" })
    expect(aging_payables_list_by_age_group.try(:age_group4_amount)).to eq nil
  end



  let(:resource) { resource = Elmas::AgingPayablesListByAgeGroup.new(id: "12abcdef-1234-1234-1234-123456abcdef", age_group4_amount: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/financial/AgingPayablesListByAgeGroup(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/financial/AgingPayablesListByAgeGroup?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/financial/AgingPayablesListByAgeGroup?$filter=AgeGroup4Amount eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:age_group4_amount, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/financial/AgingPayablesListByAgeGroup?$orderby=AgeGroup4Amount&$filter=AgeGroup4Amount eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:age_group4_amount, :id], order_by: :age_group4_amount)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/financial/AgingPayablesListByAgeGroup?$orderby=AgeGroup4Amount")
      resource.find_all(order_by: :age_group4_amount)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/AgingPayablesListByAgeGroup?$select=AgeGroup4Amount")
      resource.find_all(select: [:age_group4_amount])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/financial/AgingPayablesListByAgeGroup?$select=AgeGroup4Amount")
      resource.find_by(select: [:age_group4_amount])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/AgingPayablesListByAgeGroup?$select=AgeGroup4Amount,ID")
      resource.find_all(select: [:age_group4_amount, :id])
    end
  end
end
