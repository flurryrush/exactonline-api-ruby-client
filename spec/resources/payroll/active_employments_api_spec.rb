require 'spec_helper'

describe Elmas::ActiveEmployment do
  it "can initialize" do
    active_employment = Elmas::ActiveEmployment.new
    expect(active_employment).to be_a(Elmas::ActiveEmployment)
  end

  it "accepts attribute setter" do
    active_employment = Elmas::ActiveEmployment.new
    active_employment.contract_end_date = "78238"
    expect(active_employment.contract_end_date).to eq "78238"
  end

  it "returns value for getters" do
    active_employment = Elmas::ActiveEmployment.new({ "ContractEndDate" => "345" })
    expect(active_employment.contract_end_date).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    active_employment = Elmas::ActiveEmployment.new({ this_does_not_exist: "Piet" })
    expect(active_employment.try(:contract_end_date)).to eq nil
  end



  let(:resource) { resource = Elmas::ActiveEmployment.new(id: "12abcdef-1234-1234-1234-123456abcdef", contract_end_date: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("payroll/ActiveEmployments(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("payroll/ActiveEmployments?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("payroll/ActiveEmployments?$filter=ContractEndDate eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:contract_end_date, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("payroll/ActiveEmployments?$orderby=ContractEndDate&$filter=ContractEndDate eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:contract_end_date, :id], order_by: :contract_end_date)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("payroll/ActiveEmployments?$orderby=ContractEndDate")
      resource.find_all(order_by: :contract_end_date)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("payroll/ActiveEmployments?$select=ContractEndDate")
      resource.find_all(select: [:contract_end_date])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("payroll/ActiveEmployments?$select=ContractEndDate")
      resource.find_by(select: [:contract_end_date])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("payroll/ActiveEmployments?$select=ContractEndDate,ID")
      resource.find_all(select: [:contract_end_date, :id])
    end
  end
end
