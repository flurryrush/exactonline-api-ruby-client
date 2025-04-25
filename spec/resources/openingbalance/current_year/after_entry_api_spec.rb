require 'spec_helper'

describe Elmas::CurrentYearAfterEntry do
  it "can initialize" do
    current_year_after_entry = Elmas::CurrentYearAfterEntry.new
    expect(current_year_after_entry).to be_a(Elmas::CurrentYearAfterEntry)
  end

  it "accepts attribute setter" do
    current_year_after_entry = Elmas::CurrentYearAfterEntry.new
    current_year_after_entry.reporting_year = "78238"
    expect(current_year_after_entry.reporting_year).to eq "78238"
  end

  it "returns value for getters" do
    current_year_after_entry = Elmas::CurrentYearAfterEntry.new({ "ReportingYear" => "345" })
    expect(current_year_after_entry.reporting_year).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    current_year_after_entry = Elmas::CurrentYearAfterEntry.new({ this_does_not_exist: "Piet" })
    expect(current_year_after_entry.try(:reporting_year)).to eq nil
  end



  let(:resource) { resource = Elmas::CurrentYearAfterEntry.new(id: "12abcdef-1234-1234-1234-123456abcdef", reporting_year: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("openingbalance/CurrentYear/AfterEntry(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("openingbalance/CurrentYear/AfterEntry?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("openingbalance/CurrentYear/AfterEntry?$filter=ReportingYear eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:reporting_year, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("openingbalance/CurrentYear/AfterEntry?$orderby=ReportingYear&$filter=ReportingYear eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:reporting_year, :id], order_by: :reporting_year)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("openingbalance/CurrentYear/AfterEntry?$orderby=ReportingYear")
      resource.find_all(order_by: :reporting_year)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("openingbalance/CurrentYear/AfterEntry?$select=ReportingYear")
      resource.find_all(select: [:reporting_year])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("openingbalance/CurrentYear/AfterEntry?$select=ReportingYear")
      resource.find_by(select: [:reporting_year])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("openingbalance/CurrentYear/AfterEntry?$select=ReportingYear,ID")
      resource.find_all(select: [:reporting_year, :id])
    end
  end
end
