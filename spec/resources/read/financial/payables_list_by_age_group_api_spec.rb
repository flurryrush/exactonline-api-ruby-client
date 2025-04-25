require 'spec_helper'

describe Elmas::PayablesListByAgeGroup do
  it "can initialize" do
    payables_list_by_age_group = Elmas::PayablesListByAgeGroup.new
    expect(payables_list_by_age_group).to be_a(Elmas::PayablesListByAgeGroup)
  end

  it "accepts attribute setter" do
    payables_list_by_age_group = Elmas::PayablesListByAgeGroup.new
    payables_list_by_age_group.due_date = "78238"
    expect(payables_list_by_age_group.due_date).to eq "78238"
  end

  it "returns value for getters" do
    payables_list_by_age_group = Elmas::PayablesListByAgeGroup.new({ "DueDate" => "345" })
    expect(payables_list_by_age_group.due_date).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    payables_list_by_age_group = Elmas::PayablesListByAgeGroup.new({ this_does_not_exist: "Piet" })
    expect(payables_list_by_age_group.try(:due_date)).to eq nil
  end



  let(:resource) { resource = Elmas::PayablesListByAgeGroup.new(id: "12abcdef-1234-1234-1234-123456abcdef", due_date: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/financial/PayablesListByAgeGroup(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/financial/PayablesListByAgeGroup?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/financial/PayablesListByAgeGroup?$filter=DueDate eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:due_date, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/financial/PayablesListByAgeGroup?$orderby=DueDate&$filter=DueDate eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:due_date, :id], order_by: :due_date)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/financial/PayablesListByAgeGroup?$orderby=DueDate")
      resource.find_all(order_by: :due_date)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/PayablesListByAgeGroup?$select=DueDate")
      resource.find_all(select: [:due_date])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/financial/PayablesListByAgeGroup?$select=DueDate")
      resource.find_by(select: [:due_date])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/PayablesListByAgeGroup?$select=DueDate,ID")
      resource.find_all(select: [:due_date, :id])
    end
  end
end
