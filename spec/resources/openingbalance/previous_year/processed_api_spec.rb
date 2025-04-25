require 'spec_helper'

describe Elmas::PreviousYearProcessed do
  it "can initialize" do
    previous_year_processed = Elmas::PreviousYearProcessed.new
    expect(previous_year_processed).to be_a(Elmas::PreviousYearProcessed)
  end

  it "accepts attribute setter" do
    previous_year_processed = Elmas::PreviousYearProcessed.new
    previous_year_processed.reporting_year = "78238"
    expect(previous_year_processed.reporting_year).to eq "78238"
  end

  it "returns value for getters" do
    previous_year_processed = Elmas::PreviousYearProcessed.new({ "ReportingYear" => "345" })
    expect(previous_year_processed.reporting_year).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    previous_year_processed = Elmas::PreviousYearProcessed.new({ this_does_not_exist: "Piet" })
    expect(previous_year_processed.try(:reporting_year)).to eq nil
  end



  let(:resource) { resource = Elmas::PreviousYearProcessed.new(id: "12abcdef-1234-1234-1234-123456abcdef", reporting_year: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("openingbalance/PreviousYear/Processed(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("openingbalance/PreviousYear/Processed?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("openingbalance/PreviousYear/Processed?$filter=ReportingYear eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:reporting_year, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("openingbalance/PreviousYear/Processed?$orderby=ReportingYear&$filter=ReportingYear eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:reporting_year, :id], order_by: :reporting_year)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("openingbalance/PreviousYear/Processed?$orderby=ReportingYear")
      resource.find_all(order_by: :reporting_year)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("openingbalance/PreviousYear/Processed?$select=ReportingYear")
      resource.find_all(select: [:reporting_year])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("openingbalance/PreviousYear/Processed?$select=ReportingYear")
      resource.find_by(select: [:reporting_year])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("openingbalance/PreviousYear/Processed?$select=ReportingYear,ID")
      resource.find_all(select: [:reporting_year, :id])
    end
  end
end
