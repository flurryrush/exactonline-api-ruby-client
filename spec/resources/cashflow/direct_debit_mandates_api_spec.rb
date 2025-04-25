require 'spec_helper'

describe Elmas::DirectDebitMandate do
  it "can initialize" do
    direct_debit_mandate = Elmas::DirectDebitMandate.new
    expect(direct_debit_mandate).to be_a(Elmas::DirectDebitMandate)
  end

  it "accepts attribute setter" do
    direct_debit_mandate = Elmas::DirectDebitMandate.new
    direct_debit_mandate.division = "78238"
    expect(direct_debit_mandate.division).to eq "78238"
  end

  it "returns value for getters" do
    direct_debit_mandate = Elmas::DirectDebitMandate.new({ "Division" => "345" })
    expect(direct_debit_mandate.division).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    direct_debit_mandate = Elmas::DirectDebitMandate.new({ this_does_not_exist: "Piet" })
    expect(direct_debit_mandate.try(:division)).to eq nil
  end

  it "is valid with mandatory attributes" do
    direct_debit_mandate = Elmas::DirectDebitMandate.new(account: "Account", bank_account: "BankAccount")
    expect(direct_debit_mandate.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    direct_debit_mandate = Elmas::DirectDebitMandate.new
    expect(direct_debit_mandate.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::DirectDebitMandate.new(id: "12abcdef-1234-1234-1234-123456abcdef", division: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("cashflow/DirectDebitMandates(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("cashflow/DirectDebitMandates?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("cashflow/DirectDebitMandates?$filter=Division eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:division, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("cashflow/DirectDebitMandates?$orderby=Division&$filter=Division eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:division, :id], order_by: :division)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("cashflow/DirectDebitMandates?$orderby=Division")
      resource.find_all(order_by: :division)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("cashflow/DirectDebitMandates?$select=Division")
      resource.find_all(select: [:division])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("cashflow/DirectDebitMandates?$select=Division")
      resource.find_by(select: [:division])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("cashflow/DirectDebitMandates?$select=Division,ID")
      resource.find_all(select: [:division, :id])
    end
  end
end
