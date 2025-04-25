require 'spec_helper'

describe Elmas::Return do
  it "can initialize" do
    ret = Elmas::Return.new
    expect(ret).to be_a(Elmas::Return)
  end

  it "accepts attribute setter" do
    ret = Elmas::Return.new
    ret.payroll_declaration_type = "78238"
    expect(ret.payroll_declaration_type).to eq "78238"
  end

  it "rets value for getters" do
    ret = Elmas::Return.new({ "PayrollDeclarationType" => "345" })
    expect(ret.payroll_declaration_type).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    ret = Elmas::Return.new({ this_does_not_exist: "Piet" })
    expect(ret.try(:payroll_declaration_type)).to eq nil
  end



  let(:resource) { resource = Elmas::Return.new(id: "12abcdef-1234-1234-1234-123456abcdef", payroll_declaration_type: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/financial/Returns(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/financial/Returns?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/financial/Returns?$filter=PayrollDeclarationType eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:payroll_declaration_type, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/financial/Returns?$orderby=PayrollDeclarationType&$filter=PayrollDeclarationType eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:payroll_declaration_type, :id], order_by: :payroll_declaration_type)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/financial/Returns?$orderby=PayrollDeclarationType")
      resource.find_all(order_by: :payroll_declaration_type)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/Returns?$select=PayrollDeclarationType")
      resource.find_all(select: [:payroll_declaration_type])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/financial/Returns?$select=PayrollDeclarationType")
      resource.find_by(select: [:payroll_declaration_type])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/Returns?$select=PayrollDeclarationType,ID")
      resource.find_all(select: [:payroll_declaration_type, :id])
    end
  end
end
