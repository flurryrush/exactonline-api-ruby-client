require 'spec_helper'

describe Elmas::SyncCashflowPaymentTerm do
  it "can initialize" do
    sync_cashflow_payment_term = Elmas::SyncCashflowPaymentTerm.new
    expect(sync_cashflow_payment_term).to be_a(Elmas::SyncCashflowPaymentTerm)
  end

  it "accepts attribute setter" do
    sync_cashflow_payment_term = Elmas::SyncCashflowPaymentTerm.new
    sync_cashflow_payment_term.direct_debit_mandate_payment_type = "78238"
    expect(sync_cashflow_payment_term.direct_debit_mandate_payment_type).to eq "78238"
  end

  it "returns value for getters" do
    sync_cashflow_payment_term = Elmas::SyncCashflowPaymentTerm.new({ "DirectDebitMandatePaymentType" => "345" })
    expect(sync_cashflow_payment_term.direct_debit_mandate_payment_type).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_cashflow_payment_term = Elmas::SyncCashflowPaymentTerm.new({ this_does_not_exist: "Piet" })
    expect(sync_cashflow_payment_term.try(:direct_debit_mandate_payment_type)).to eq nil
  end



  let(:resource) { resource = Elmas::SyncCashflowPaymentTerm.new(id: "12abcdef-1234-1234-1234-123456abcdef", direct_debit_mandate_payment_type: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Cashflow/PaymentTerms(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Cashflow/PaymentTerms?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Cashflow/PaymentTerms?$filter=DirectDebitMandatePaymentType eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:direct_debit_mandate_payment_type, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Cashflow/PaymentTerms?$orderby=DirectDebitMandatePaymentType&$filter=DirectDebitMandatePaymentType eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:direct_debit_mandate_payment_type, :id], order_by: :direct_debit_mandate_payment_type)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Cashflow/PaymentTerms?$orderby=DirectDebitMandatePaymentType")
      resource.find_all(order_by: :direct_debit_mandate_payment_type)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Cashflow/PaymentTerms?$select=DirectDebitMandatePaymentType")
      resource.find_all(select: [:direct_debit_mandate_payment_type])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Cashflow/PaymentTerms?$select=DirectDebitMandatePaymentType")
      resource.find_by(select: [:direct_debit_mandate_payment_type])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Cashflow/PaymentTerms?$select=DirectDebitMandatePaymentType,ID")
      resource.find_all(select: [:direct_debit_mandate_payment_type, :id])
    end
  end
end
