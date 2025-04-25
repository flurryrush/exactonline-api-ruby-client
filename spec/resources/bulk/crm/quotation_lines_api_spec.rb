require 'spec_helper'

describe Elmas::BulkCRMQuotationLine do
  it "can initialize" do
    bulk_crm_quotation_line = Elmas::BulkCRMQuotationLine.new
    expect(bulk_crm_quotation_line).to be_a(Elmas::BulkCRMQuotationLine)
  end

  it "accepts attribute setter" do
    bulk_crm_quotation_line = Elmas::BulkCRMQuotationLine.new
    bulk_crm_quotation_line.description = "78238"
    expect(bulk_crm_quotation_line.description).to eq "78238"
  end

  it "returns value for getters" do
    bulk_crm_quotation_line = Elmas::BulkCRMQuotationLine.new({ "Description" => "345" })
    expect(bulk_crm_quotation_line.description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    bulk_crm_quotation_line = Elmas::BulkCRMQuotationLine.new({ this_does_not_exist: "Piet" })
    expect(bulk_crm_quotation_line.try(:description)).to eq nil
  end

  it "is valid with mandatory attributes" do
    bulk_crm_quotation_line = Elmas::BulkCRMQuotationLine.new(item: "Item", quotation_id: "QuotationID")
    expect(bulk_crm_quotation_line.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    bulk_crm_quotation_line = Elmas::BulkCRMQuotationLine.new
    expect(bulk_crm_quotation_line.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::BulkCRMQuotationLine.new(id: "12abcdef-1234-1234-1234-123456abcdef", description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("bulk/CRM/QuotationLines(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("bulk/CRM/QuotationLines?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("bulk/CRM/QuotationLines?$filter=Description eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("bulk/CRM/QuotationLines?$orderby=Description&$filter=Description eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:description, :id], order_by: :description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("bulk/CRM/QuotationLines?$orderby=Description")
      resource.find_all(order_by: :description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/CRM/QuotationLines?$select=Description")
      resource.find_all(select: [:description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("bulk/CRM/QuotationLines?$select=Description")
      resource.find_by(select: [:description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/CRM/QuotationLines?$select=Description,ID")
      resource.find_all(select: [:description, :id])
    end
  end
end
