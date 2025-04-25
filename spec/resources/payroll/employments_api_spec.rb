require 'spec_helper'

describe Elmas::Employment do
  it "can initialize" do
    employment = Elmas::Employment.new
    expect(employment).to be_a(Elmas::Employment)
  end

  it "accepts attribute setter" do
    employment = Elmas::Employment.new
    employment.start_date = "78238"
    expect(employment.start_date).to eq "78238"
  end

  it "returns value for getters" do
    employment = Elmas::Employment.new({ "StartDate" => "345" })
    expect(employment.start_date).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    employment = Elmas::Employment.new({ this_does_not_exist: "Piet" })
    expect(employment.try(:start_date)).to eq nil
  end



  let(:resource) { resource = Elmas::Employment.new(id: "12abcdef-1234-1234-1234-123456abcdef", start_date: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("payroll/Employments(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("payroll/Employments?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("payroll/Employments?$filter=StartDate eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:start_date, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("payroll/Employments?$orderby=StartDate&$filter=StartDate eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:start_date, :id], order_by: :start_date)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("payroll/Employments?$orderby=StartDate")
      resource.find_all(order_by: :start_date)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("payroll/Employments?$select=StartDate")
      resource.find_all(select: [:start_date])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("payroll/Employments?$select=StartDate")
      resource.find_by(select: [:start_date])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("payroll/Employments?$select=StartDate,ID")
      resource.find_all(select: [:start_date, :id])
    end
  end
end
