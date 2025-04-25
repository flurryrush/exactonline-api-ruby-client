require 'spec_helper'

describe Elmas::ExchangeRate do
  it "can initialize" do
    exchange_rate = Elmas::ExchangeRate.new
    expect(exchange_rate).to be_a(Elmas::ExchangeRate)
  end

  it "accepts attribute setter" do
    exchange_rate = Elmas::ExchangeRate.new
    exchange_rate.target_currency_description = "78238"
    expect(exchange_rate.target_currency_description).to eq "78238"
  end

  it "returns value for getters" do
    exchange_rate = Elmas::ExchangeRate.new({ "TargetCurrencyDescription" => "345" })
    expect(exchange_rate.target_currency_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    exchange_rate = Elmas::ExchangeRate.new({ this_does_not_exist: "Piet" })
    expect(exchange_rate.try(:target_currency_description)).to eq nil
  end

  it "is valid with mandatory attributes" do
    exchange_rate = Elmas::ExchangeRate.new(source_currency: "SourceCurrency")
    expect(exchange_rate.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    exchange_rate = Elmas::ExchangeRate.new
    expect(exchange_rate.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ExchangeRate.new(id: "12abcdef-1234-1234-1234-123456abcdef", target_currency_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("financial/ExchangeRates(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("financial/ExchangeRates?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("financial/ExchangeRates?$filter=TargetCurrencyDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:target_currency_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("financial/ExchangeRates?$orderby=TargetCurrencyDescription&$filter=TargetCurrencyDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:target_currency_description, :id], order_by: :target_currency_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("financial/ExchangeRates?$orderby=TargetCurrencyDescription")
      resource.find_all(order_by: :target_currency_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("financial/ExchangeRates?$select=TargetCurrencyDescription")
      resource.find_all(select: [:target_currency_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("financial/ExchangeRates?$select=TargetCurrencyDescription")
      resource.find_by(select: [:target_currency_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("financial/ExchangeRates?$select=TargetCurrencyDescription,ID")
      resource.find_all(select: [:target_currency_description, :id])
    end
  end
end
