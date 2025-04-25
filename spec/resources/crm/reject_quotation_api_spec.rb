require 'spec_helper'

describe Elmas::RejectQuotation do
  it "can initialize" do
    reject_quotation = Elmas::RejectQuotation.new
    expect(reject_quotation).to be_a(Elmas::RejectQuotation)
  end

  it "accepts attribute setter" do
    reject_quotation = Elmas::RejectQuotation.new
    reject_quotation.error_message = "78238"
    expect(reject_quotation.error_message).to eq "78238"
  end

  it "returns value for getters" do
    reject_quotation = Elmas::RejectQuotation.new({ "ErrorMessage" => "345" })
    expect(reject_quotation.error_message).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    reject_quotation = Elmas::RejectQuotation.new({ this_does_not_exist: "Piet" })
    expect(reject_quotation.try(:error_message)).to eq nil
  end

  it "is valid with mandatory attributes" do
    reject_quotation = Elmas::RejectQuotation.new(quotation_id: "QuotationID")
    expect(reject_quotation.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    reject_quotation = Elmas::RejectQuotation.new
    expect(reject_quotation.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::RejectQuotation.new(id: "12abcdef-1234-1234-1234-123456abcdef", error_message: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("crm/RejectQuotation(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("crm/RejectQuotation?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("crm/RejectQuotation?$filter=ErrorMessage eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:error_message, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("crm/RejectQuotation?$orderby=ErrorMessage&$filter=ErrorMessage eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:error_message, :id], order_by: :error_message)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("crm/RejectQuotation?$orderby=ErrorMessage")
      resource.find_all(order_by: :error_message)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/RejectQuotation?$select=ErrorMessage")
      resource.find_all(select: [:error_message])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("crm/RejectQuotation?$select=ErrorMessage")
      resource.find_by(select: [:error_message])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/RejectQuotation?$select=ErrorMessage,ID")
      resource.find_all(select: [:error_message, :id])
    end
  end
end
