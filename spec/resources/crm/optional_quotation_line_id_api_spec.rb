require 'spec_helper'

describe Elmas::OptionalQuotationLineID do
  it "can initialize" do
    optional_quotation_line_id = Elmas::OptionalQuotationLineID.new
    expect(optional_quotation_line_id).to be_a(Elmas::OptionalQuotationLineID)
  end

  let(:resource) { resource = Elmas::OptionalQuotationLineID.new(id: "12abcdef-1234-1234-1234-123456abcdef") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("crm/OptionalQuotationLineID(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("crm/OptionalQuotationLineID?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("crm/OptionalQuotationLineID?$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("crm/OptionalQuotationLineID?$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:id])
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/OptionalQuotationLineID?$select=ID")
      resource.find_all(select: [:id])
    end
  end
end
