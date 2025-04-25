require 'spec_helper'

describe Elmas::JournalStatusByFinancialPeriod do
  it "can initialize" do
    journal_status_by_financial_period = Elmas::JournalStatusByFinancialPeriod.new
    expect(journal_status_by_financial_period).to be_a(Elmas::JournalStatusByFinancialPeriod)
  end

  it "accepts attribute setter" do
    journal_status_by_financial_period = Elmas::JournalStatusByFinancialPeriod.new
    journal_status_by_financial_period.period = "78238"
    expect(journal_status_by_financial_period.period).to eq "78238"
  end

  it "returns value for getters" do
    journal_status_by_financial_period = Elmas::JournalStatusByFinancialPeriod.new({ "Period" => "345" })
    expect(journal_status_by_financial_period.period).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    journal_status_by_financial_period = Elmas::JournalStatusByFinancialPeriod.new({ this_does_not_exist: "Piet" })
    expect(journal_status_by_financial_period.try(:period)).to eq nil
  end



  let(:resource) { resource = Elmas::JournalStatusByFinancialPeriod.new(id: "12abcdef-1234-1234-1234-123456abcdef", period: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/financial/JournalStatusByFinancialPeriod(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/financial/JournalStatusByFinancialPeriod?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/financial/JournalStatusByFinancialPeriod?$filter=Period eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:period, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/financial/JournalStatusByFinancialPeriod?$orderby=Period&$filter=Period eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:period, :id], order_by: :period)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/financial/JournalStatusByFinancialPeriod?$orderby=Period")
      resource.find_all(order_by: :period)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/JournalStatusByFinancialPeriod?$select=Period")
      resource.find_all(select: [:period])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/financial/JournalStatusByFinancialPeriod?$select=Period")
      resource.find_by(select: [:period])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/JournalStatusByFinancialPeriod?$select=Period,ID")
      resource.find_all(select: [:period, :id])
    end
  end
end
