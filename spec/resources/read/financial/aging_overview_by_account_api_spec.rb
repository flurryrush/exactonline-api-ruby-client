require 'spec_helper'

describe Elmas::AgingOverviewByAccount do
  it "can initialize" do
    aging_overview_by_account = Elmas::AgingOverviewByAccount.new
    expect(aging_overview_by_account).to be_a(Elmas::AgingOverviewByAccount)
  end

  it "accepts attribute setter" do
    aging_overview_by_account = Elmas::AgingOverviewByAccount.new
    aging_overview_by_account.currency_code = "78238"
    expect(aging_overview_by_account.currency_code).to eq "78238"
  end

  it "returns value for getters" do
    aging_overview_by_account = Elmas::AgingOverviewByAccount.new({ "CurrencyCode" => "345" })
    expect(aging_overview_by_account.currency_code).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    aging_overview_by_account = Elmas::AgingOverviewByAccount.new({ this_does_not_exist: "Piet" })
    expect(aging_overview_by_account.try(:currency_code)).to eq nil
  end



  let(:resource) { resource = Elmas::AgingOverviewByAccount.new(id: "12abcdef-1234-1234-1234-123456abcdef", currency_code: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/financial/AgingOverviewByAccount(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/financial/AgingOverviewByAccount?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/financial/AgingOverviewByAccount?$filter=CurrencyCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:currency_code, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/financial/AgingOverviewByAccount?$orderby=CurrencyCode&$filter=CurrencyCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:currency_code, :id], order_by: :currency_code)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/financial/AgingOverviewByAccount?$orderby=CurrencyCode")
      resource.find_all(order_by: :currency_code)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/AgingOverviewByAccount?$select=CurrencyCode")
      resource.find_all(select: [:currency_code])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/financial/AgingOverviewByAccount?$select=CurrencyCode")
      resource.find_by(select: [:currency_code])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/AgingOverviewByAccount?$select=CurrencyCode,ID")
      resource.find_all(select: [:currency_code, :id])
    end
  end
end
