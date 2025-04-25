require 'spec_helper'

describe Elmas::EmploymentEndReasonsOnFocusDate do
  it "can initialize" do
    employment_end_reasons_on_focus_date = Elmas::EmploymentEndReasonsOnFocusDate.new
    expect(employment_end_reasons_on_focus_date).to be_a(Elmas::EmploymentEndReasonsOnFocusDate)
  end

  it "accepts attribute setter" do
    employment_end_reasons_on_focus_date = Elmas::EmploymentEndReasonsOnFocusDate.new
    employment_end_reasons_on_focus_date.code = "78238"
    expect(employment_end_reasons_on_focus_date.code).to eq "78238"
  end

  it "returns value for getters" do
    employment_end_reasons_on_focus_date = Elmas::EmploymentEndReasonsOnFocusDate.new({ "Code" => "345" })
    expect(employment_end_reasons_on_focus_date.code).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    employment_end_reasons_on_focus_date = Elmas::EmploymentEndReasonsOnFocusDate.new({ this_does_not_exist: "Piet" })
    expect(employment_end_reasons_on_focus_date.try(:code)).to eq nil
  end



  let(:resource) { resource = Elmas::EmploymentEndReasonsOnFocusDate.new(id: "12abcdef-1234-1234-1234-123456abcdef", code: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/payroll/EmploymentEndReasonsOnFocusDate(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/payroll/EmploymentEndReasonsOnFocusDate?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/payroll/EmploymentEndReasonsOnFocusDate?$filter=Code eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:code, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/payroll/EmploymentEndReasonsOnFocusDate?$orderby=Code&$filter=Code eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:code, :id], order_by: :code)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/payroll/EmploymentEndReasonsOnFocusDate?$orderby=Code")
      resource.find_all(order_by: :code)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/payroll/EmploymentEndReasonsOnFocusDate?$select=Code")
      resource.find_all(select: [:code])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/payroll/EmploymentEndReasonsOnFocusDate?$select=Code")
      resource.find_by(select: [:code])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/payroll/EmploymentEndReasonsOnFocusDate?$select=Code,ID")
      resource.find_all(select: [:code, :id])
    end
  end
end
