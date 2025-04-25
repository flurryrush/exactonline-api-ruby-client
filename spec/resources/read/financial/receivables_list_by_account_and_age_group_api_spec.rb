require 'spec_helper'

describe Elmas::ReceivablesListByAccountAndAgeGroup do
  it "can initialize" do
    receivables_list_by_account_and_age_group = Elmas::ReceivablesListByAccountAndAgeGroup.new
    expect(receivables_list_by_account_and_age_group).to be_a(Elmas::ReceivablesListByAccountAndAgeGroup)
  end

  it "accepts attribute setter" do
    receivables_list_by_account_and_age_group = Elmas::ReceivablesListByAccountAndAgeGroup.new
    receivables_list_by_account_and_age_group.currency_code = "78238"
    expect(receivables_list_by_account_and_age_group.currency_code).to eq "78238"
  end

  it "returns value for getters" do
    receivables_list_by_account_and_age_group = Elmas::ReceivablesListByAccountAndAgeGroup.new({ "CurrencyCode" => "345" })
    expect(receivables_list_by_account_and_age_group.currency_code).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    receivables_list_by_account_and_age_group = Elmas::ReceivablesListByAccountAndAgeGroup.new({ this_does_not_exist: "Piet" })
    expect(receivables_list_by_account_and_age_group.try(:currency_code)).to eq nil
  end



  let(:resource) { resource = Elmas::ReceivablesListByAccountAndAgeGroup.new(id: "12abcdef-1234-1234-1234-123456abcdef", currency_code: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/financial/ReceivablesListByAccountAndAgeGroup(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/financial/ReceivablesListByAccountAndAgeGroup?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/financial/ReceivablesListByAccountAndAgeGroup?$filter=CurrencyCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:currency_code, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/financial/ReceivablesListByAccountAndAgeGroup?$orderby=CurrencyCode&$filter=CurrencyCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:currency_code, :id], order_by: :currency_code)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/financial/ReceivablesListByAccountAndAgeGroup?$orderby=CurrencyCode")
      resource.find_all(order_by: :currency_code)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/ReceivablesListByAccountAndAgeGroup?$select=CurrencyCode")
      resource.find_all(select: [:currency_code])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/financial/ReceivablesListByAccountAndAgeGroup?$select=CurrencyCode")
      resource.find_by(select: [:currency_code])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/ReceivablesListByAccountAndAgeGroup?$select=CurrencyCode,ID")
      resource.find_all(select: [:currency_code, :id])
    end
  end
end
