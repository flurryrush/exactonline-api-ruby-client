require 'spec_helper'

describe Elmas::EmploymentTaxAuthoritiesGeneral do
  it "can initialize" do
    employment_tax_authorities_general = Elmas::EmploymentTaxAuthoritiesGeneral.new
    expect(employment_tax_authorities_general).to be_a(Elmas::EmploymentTaxAuthoritiesGeneral)
  end

  it "accepts attribute setter" do
    employment_tax_authorities_general = Elmas::EmploymentTaxAuthoritiesGeneral.new
    employment_tax_authorities_general.type_of_income_description = "78238"
    expect(employment_tax_authorities_general.type_of_income_description).to eq "78238"
  end

  it "returns value for getters" do
    employment_tax_authorities_general = Elmas::EmploymentTaxAuthoritiesGeneral.new({ "TypeOfIncomeDescription" => "345" })
    expect(employment_tax_authorities_general.type_of_income_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    employment_tax_authorities_general = Elmas::EmploymentTaxAuthoritiesGeneral.new({ this_does_not_exist: "Piet" })
    expect(employment_tax_authorities_general.try(:type_of_income_description)).to eq nil
  end



  let(:resource) { resource = Elmas::EmploymentTaxAuthoritiesGeneral.new(id: "12abcdef-1234-1234-1234-123456abcdef", type_of_income_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("payroll/EmploymentTaxAuthoritiesGeneral(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("payroll/EmploymentTaxAuthoritiesGeneral?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("payroll/EmploymentTaxAuthoritiesGeneral?$filter=TypeOfIncomeDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:type_of_income_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("payroll/EmploymentTaxAuthoritiesGeneral?$orderby=TypeOfIncomeDescription&$filter=TypeOfIncomeDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:type_of_income_description, :id], order_by: :type_of_income_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("payroll/EmploymentTaxAuthoritiesGeneral?$orderby=TypeOfIncomeDescription")
      resource.find_all(order_by: :type_of_income_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("payroll/EmploymentTaxAuthoritiesGeneral?$select=TypeOfIncomeDescription")
      resource.find_all(select: [:type_of_income_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("payroll/EmploymentTaxAuthoritiesGeneral?$select=TypeOfIncomeDescription")
      resource.find_by(select: [:type_of_income_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("payroll/EmploymentTaxAuthoritiesGeneral?$select=TypeOfIncomeDescription,ID")
      resource.find_all(select: [:type_of_income_description, :id])
    end
  end
end
