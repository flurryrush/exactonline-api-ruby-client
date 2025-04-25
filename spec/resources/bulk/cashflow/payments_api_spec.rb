require 'spec_helper'

describe Elmas::BulkCashflowPayment do
  it "can initialize" do
    bulk_cashflow_payment = Elmas::BulkCashflowPayment.new
    expect(bulk_cashflow_payment).to be_a(Elmas::BulkCashflowPayment)
  end

  it "accepts attribute setter" do
    bulk_cashflow_payment = Elmas::BulkCashflowPayment.new
    bulk_cashflow_payment.gl_account_code = "78238"
    expect(bulk_cashflow_payment.gl_account_code).to eq "78238"
  end

  it "returns value for getters" do
    bulk_cashflow_payment = Elmas::BulkCashflowPayment.new({ "GLAccountCode" => "345" })
    expect(bulk_cashflow_payment.gl_account_code).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    bulk_cashflow_payment = Elmas::BulkCashflowPayment.new({ this_does_not_exist: "Piet" })
    expect(bulk_cashflow_payment.try(:gl_account_code)).to eq nil
  end



  let(:resource) { resource = Elmas::BulkCashflowPayment.new(id: "12abcdef-1234-1234-1234-123456abcdef", gl_account_code: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("bulk/Cashflow/Payments(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("bulk/Cashflow/Payments?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("bulk/Cashflow/Payments?$filter=GLAccountCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:gl_account_code, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("bulk/Cashflow/Payments?$orderby=GLAccountCode&$filter=GLAccountCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:gl_account_code, :id], order_by: :gl_account_code)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("bulk/Cashflow/Payments?$orderby=GLAccountCode")
      resource.find_all(order_by: :gl_account_code)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/Cashflow/Payments?$select=GLAccountCode")
      resource.find_all(select: [:gl_account_code])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("bulk/Cashflow/Payments?$select=GLAccountCode")
      resource.find_by(select: [:gl_account_code])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/Cashflow/Payments?$select=GLAccountCode,ID")
      resource.find_all(select: [:gl_account_code, :id])
    end
  end
end
