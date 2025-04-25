require 'spec_helper'

describe Elmas::ProcessPayment do
  it "can initialize" do
    process_payment = Elmas::ProcessPayment.new
    expect(process_payment).to be_a(Elmas::ProcessPayment)
  end

  it "accepts attribute setter" do
    process_payment = Elmas::ProcessPayment.new
    process_payment.success_message = "78238"
    expect(process_payment.success_message).to eq "78238"
  end

  it "returns value for getters" do
    process_payment = Elmas::ProcessPayment.new({ "SuccessMessage" => "345" })
    expect(process_payment.success_message).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    process_payment = Elmas::ProcessPayment.new({ this_does_not_exist: "Piet" })
    expect(process_payment.try(:success_message)).to eq nil
  end

  it "is valid with mandatory attributes" do
    process_payment = Elmas::ProcessPayment.new(payment_ids: "PaymentIDs")
    expect(process_payment.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    process_payment = Elmas::ProcessPayment.new
    expect(process_payment.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ProcessPayment.new(id: "12abcdef-1234-1234-1234-123456abcdef", success_message: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("cashflow/ProcessPayments(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("cashflow/ProcessPayments?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("cashflow/ProcessPayments?$filter=SuccessMessage eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:success_message, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("cashflow/ProcessPayments?$orderby=SuccessMessage&$filter=SuccessMessage eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:success_message, :id], order_by: :success_message)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("cashflow/ProcessPayments?$orderby=SuccessMessage")
      resource.find_all(order_by: :success_message)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("cashflow/ProcessPayments?$select=SuccessMessage")
      resource.find_all(select: [:success_message])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("cashflow/ProcessPayments?$select=SuccessMessage")
      resource.find_by(select: [:success_message])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("cashflow/ProcessPayments?$select=SuccessMessage,ID")
      resource.find_all(select: [:success_message, :id])
    end
  end
end
