require 'spec_helper'

describe Elmas::AgingReceivablesListByAgeGroup do
  it "can initialize" do
    aging_receivables_list_by_age_group = Elmas::AgingReceivablesListByAgeGroup.new
    expect(aging_receivables_list_by_age_group).to be_a(Elmas::AgingReceivablesListByAgeGroup)
  end

  it "accepts attribute setter" do
    aging_receivables_list_by_age_group = Elmas::AgingReceivablesListByAgeGroup.new
    aging_receivables_list_by_age_group.age_group1_amount = "78238"
    expect(aging_receivables_list_by_age_group.age_group1_amount).to eq "78238"
  end

  it "returns value for getters" do
    aging_receivables_list_by_age_group = Elmas::AgingReceivablesListByAgeGroup.new({ "AgeGroup1Amount" => "345" })
    expect(aging_receivables_list_by_age_group.age_group1_amount).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    aging_receivables_list_by_age_group = Elmas::AgingReceivablesListByAgeGroup.new({ this_does_not_exist: "Piet" })
    expect(aging_receivables_list_by_age_group.try(:age_group1_amount)).to eq nil
  end



  let(:resource) { resource = Elmas::AgingReceivablesListByAgeGroup.new(id: "12abcdef-1234-1234-1234-123456abcdef", age_group1_amount: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/financial/AgingReceivablesListByAgeGroup(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/financial/AgingReceivablesListByAgeGroup?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/financial/AgingReceivablesListByAgeGroup?$filter=AgeGroup1Amount eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:age_group1_amount, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/financial/AgingReceivablesListByAgeGroup?$orderby=AgeGroup1Amount&$filter=AgeGroup1Amount eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:age_group1_amount, :id], order_by: :age_group1_amount)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/financial/AgingReceivablesListByAgeGroup?$orderby=AgeGroup1Amount")
      resource.find_all(order_by: :age_group1_amount)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/AgingReceivablesListByAgeGroup?$select=AgeGroup1Amount")
      resource.find_all(select: [:age_group1_amount])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/financial/AgingReceivablesListByAgeGroup?$select=AgeGroup1Amount")
      resource.find_by(select: [:age_group1_amount])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/AgingReceivablesListByAgeGroup?$select=AgeGroup1Amount,ID")
      resource.find_all(select: [:age_group1_amount, :id])
    end
  end
end
