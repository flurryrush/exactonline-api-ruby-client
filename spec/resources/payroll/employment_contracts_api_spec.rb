require 'spec_helper'

describe Elmas::EmploymentContract do
  it "can initialize" do
    employment_contract = Elmas::EmploymentContract.new
    expect(employment_contract).to be_a(Elmas::EmploymentContract)
  end

  it "accepts attribute setter" do
    employment_contract = Elmas::EmploymentContract.new
    employment_contract.employment_number = "78238"
    expect(employment_contract.employment_number).to eq "78238"
  end

  it "returns value for getters" do
    employment_contract = Elmas::EmploymentContract.new({ "EmploymentNumber" => "345" })
    expect(employment_contract.employment_number).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    employment_contract = Elmas::EmploymentContract.new({ this_does_not_exist: "Piet" })
    expect(employment_contract.try(:employment_number)).to eq nil
  end

  it "is valid with mandatory attributes" do
    employment_contract = Elmas::EmploymentContract.new(employment: "Employment")
    expect(employment_contract.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    employment_contract = Elmas::EmploymentContract.new
    expect(employment_contract.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::EmploymentContract.new(id: "12abcdef-1234-1234-1234-123456abcdef", employment_number: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("payroll/EmploymentContracts(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("payroll/EmploymentContracts?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("payroll/EmploymentContracts?$filter=EmploymentNumber eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:employment_number, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("payroll/EmploymentContracts?$orderby=EmploymentNumber&$filter=EmploymentNumber eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:employment_number, :id], order_by: :employment_number)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("payroll/EmploymentContracts?$orderby=EmploymentNumber")
      resource.find_all(order_by: :employment_number)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("payroll/EmploymentContracts?$select=EmploymentNumber")
      resource.find_all(select: [:employment_number])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("payroll/EmploymentContracts?$select=EmploymentNumber")
      resource.find_by(select: [:employment_number])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("payroll/EmploymentContracts?$select=EmploymentNumber,ID")
      resource.find_all(select: [:employment_number, :id])
    end
  end
end
