require 'spec_helper'

describe Elmas::SyncCRMQuotationLine do
  it "can initialize" do
    sync_crm_quotation_line = Elmas::SyncCRMQuotationLine.new
    expect(sync_crm_quotation_line).to be_a(Elmas::SyncCRMQuotationLine)
  end

  it "accepts attribute setter" do
    sync_crm_quotation_line = Elmas::SyncCRMQuotationLine.new
    sync_crm_quotation_line.vat_percentage = "78238"
    expect(sync_crm_quotation_line.vat_percentage).to eq "78238"
  end

  it "returns value for getters" do
    sync_crm_quotation_line = Elmas::SyncCRMQuotationLine.new({ "VATPercentage" => "345" })
    expect(sync_crm_quotation_line.vat_percentage).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_crm_quotation_line = Elmas::SyncCRMQuotationLine.new({ this_does_not_exist: "Piet" })
    expect(sync_crm_quotation_line.try(:vat_percentage)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sync_crm_quotation_line = Elmas::SyncCRMQuotationLine.new(item: "Item", quotation_id: "QuotationID")
    expect(sync_crm_quotation_line.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sync_crm_quotation_line = Elmas::SyncCRMQuotationLine.new
    expect(sync_crm_quotation_line.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SyncCRMQuotationLine.new(id: "12abcdef-1234-1234-1234-123456abcdef", vat_percentage: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/CRM/QuotationLines(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/CRM/QuotationLines?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/CRM/QuotationLines?$filter=VATPercentage eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:vat_percentage, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/CRM/QuotationLines?$orderby=VATPercentage&$filter=VATPercentage eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:vat_percentage, :id], order_by: :vat_percentage)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/CRM/QuotationLines?$orderby=VATPercentage")
      resource.find_all(order_by: :vat_percentage)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/CRM/QuotationLines?$select=VATPercentage")
      resource.find_all(select: [:vat_percentage])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/CRM/QuotationLines?$select=VATPercentage")
      resource.find_by(select: [:vat_percentage])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/CRM/QuotationLines?$select=VATPercentage,ID")
      resource.find_all(select: [:vat_percentage, :id])
    end
  end
end
