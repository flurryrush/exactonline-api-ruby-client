require 'spec_helper'

describe Elmas::EmploymentOrganization do
  it "can initialize" do
    employment_organization = Elmas::EmploymentOrganization.new
    expect(employment_organization).to be_a(Elmas::EmploymentOrganization)
  end

  it "accepts attribute setter" do
    employment_organization = Elmas::EmploymentOrganization.new
    employment_organization.cost_unit = "78238"
    expect(employment_organization.cost_unit).to eq "78238"
  end

  it "returns value for getters" do
    employment_organization = Elmas::EmploymentOrganization.new({ "CostUnit" => "345" })
    expect(employment_organization.cost_unit).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    employment_organization = Elmas::EmploymentOrganization.new({ this_does_not_exist: "Piet" })
    expect(employment_organization.try(:cost_unit)).to eq nil
  end

  it "is valid with mandatory attributes" do
    employment_organization = Elmas::EmploymentOrganization.new(department: "Department", employment: "Employment", job_title: "JobTitle")
    expect(employment_organization.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    employment_organization = Elmas::EmploymentOrganization.new
    expect(employment_organization.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::EmploymentOrganization.new(id: "12abcdef-1234-1234-1234-123456abcdef", cost_unit: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("payroll/EmploymentOrganizations(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("payroll/EmploymentOrganizations?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("payroll/EmploymentOrganizations?$filter=CostUnit eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:cost_unit, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("payroll/EmploymentOrganizations?$orderby=CostUnit&$filter=CostUnit eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:cost_unit, :id], order_by: :cost_unit)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("payroll/EmploymentOrganizations?$orderby=CostUnit")
      resource.find_all(order_by: :cost_unit)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("payroll/EmploymentOrganizations?$select=CostUnit")
      resource.find_all(select: [:cost_unit])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("payroll/EmploymentOrganizations?$select=CostUnit")
      resource.find_by(select: [:cost_unit])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("payroll/EmploymentOrganizations?$select=CostUnit,ID")
      resource.find_all(select: [:cost_unit, :id])
    end
  end
end
