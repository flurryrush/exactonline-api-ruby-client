require 'spec_helper'

describe Elmas::EmploymentInternalRate do
  it "can initialize" do
    employment_internal_rate = Elmas::EmploymentInternalRate.new
    expect(employment_internal_rate).to be_a(Elmas::EmploymentInternalRate)
  end

  it "accepts attribute setter" do
    employment_internal_rate = Elmas::EmploymentInternalRate.new
    employment_internal_rate.start_date = "78238"
    expect(employment_internal_rate.start_date).to eq "78238"
  end

  it "returns value for getters" do
    employment_internal_rate = Elmas::EmploymentInternalRate.new({ "StartDate" => "345" })
    expect(employment_internal_rate.start_date).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    employment_internal_rate = Elmas::EmploymentInternalRate.new({ this_does_not_exist: "Piet" })
    expect(employment_internal_rate.try(:start_date)).to eq nil
  end



  let(:resource) { resource = Elmas::EmploymentInternalRate.new(id: "12abcdef-1234-1234-1234-123456abcdef", start_date: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("project/EmploymentInternalRates(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("project/EmploymentInternalRates?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("project/EmploymentInternalRates?$filter=StartDate eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:start_date, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("project/EmploymentInternalRates?$orderby=StartDate&$filter=StartDate eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:start_date, :id], order_by: :start_date)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("project/EmploymentInternalRates?$orderby=StartDate")
      resource.find_all(order_by: :start_date)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/EmploymentInternalRates?$select=StartDate")
      resource.find_all(select: [:start_date])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("project/EmploymentInternalRates?$select=StartDate")
      resource.find_by(select: [:start_date])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/EmploymentInternalRates?$select=StartDate,ID")
      resource.find_all(select: [:start_date, :id])
    end
  end
end
