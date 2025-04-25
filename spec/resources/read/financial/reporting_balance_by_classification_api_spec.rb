require 'spec_helper'

describe Elmas::ReportingBalanceByClassification do
  it "can initialize" do
    reporting_balance_by_classification = Elmas::ReportingBalanceByClassification.new
    expect(reporting_balance_by_classification).to be_a(Elmas::ReportingBalanceByClassification)
  end

  it "accepts attribute setter" do
    reporting_balance_by_classification = Elmas::ReportingBalanceByClassification.new
    reporting_balance_by_classification.status = "78238"
    expect(reporting_balance_by_classification.status).to eq "78238"
  end

  it "returns value for getters" do
    reporting_balance_by_classification = Elmas::ReportingBalanceByClassification.new({ "Status" => "345" })
    expect(reporting_balance_by_classification.status).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    reporting_balance_by_classification = Elmas::ReportingBalanceByClassification.new({ this_does_not_exist: "Piet" })
    expect(reporting_balance_by_classification.try(:status)).to eq nil
  end



  let(:resource) { resource = Elmas::ReportingBalanceByClassification.new(id: "12abcdef-1234-1234-1234-123456abcdef", status: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/financial/ReportingBalanceByClassification(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/financial/ReportingBalanceByClassification?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/financial/ReportingBalanceByClassification?$filter=Status eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:status, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/financial/ReportingBalanceByClassification?$orderby=Status&$filter=Status eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:status, :id], order_by: :status)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/financial/ReportingBalanceByClassification?$orderby=Status")
      resource.find_all(order_by: :status)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/ReportingBalanceByClassification?$select=Status")
      resource.find_all(select: [:status])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/financial/ReportingBalanceByClassification?$select=Status")
      resource.find_by(select: [:status])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/ReportingBalanceByClassification?$select=Status,ID")
      resource.find_all(select: [:status, :id])
    end
  end
end
