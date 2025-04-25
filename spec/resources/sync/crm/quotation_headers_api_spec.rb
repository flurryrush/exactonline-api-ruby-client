require 'spec_helper'

describe Elmas::SyncCRMQuotationHeader do
  it "can initialize" do
    sync_crm_quotation_header = Elmas::SyncCRMQuotationHeader.new
    expect(sync_crm_quotation_header).to be_a(Elmas::SyncCRMQuotationHeader)
  end

  it "accepts attribute setter" do
    sync_crm_quotation_header = Elmas::SyncCRMQuotationHeader.new
    sync_crm_quotation_header.delivery_account_name = "78238"
    expect(sync_crm_quotation_header.delivery_account_name).to eq "78238"
  end

  it "returns value for getters" do
    sync_crm_quotation_header = Elmas::SyncCRMQuotationHeader.new({ "DeliveryAccountName" => "345" })
    expect(sync_crm_quotation_header.delivery_account_name).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_crm_quotation_header = Elmas::SyncCRMQuotationHeader.new({ this_does_not_exist: "Piet" })
    expect(sync_crm_quotation_header.try(:delivery_account_name)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sync_crm_quotation_header = Elmas::SyncCRMQuotationHeader.new(order_account: "OrderAccount", quotation_id: "QuotationID")
    expect(sync_crm_quotation_header.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sync_crm_quotation_header = Elmas::SyncCRMQuotationHeader.new
    expect(sync_crm_quotation_header.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SyncCRMQuotationHeader.new(id: "12abcdef-1234-1234-1234-123456abcdef", delivery_account_name: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/CRM/QuotationHeaders(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/CRM/QuotationHeaders?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/CRM/QuotationHeaders?$filter=DeliveryAccountName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:delivery_account_name, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/CRM/QuotationHeaders?$orderby=DeliveryAccountName&$filter=DeliveryAccountName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:delivery_account_name, :id], order_by: :delivery_account_name)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/CRM/QuotationHeaders?$orderby=DeliveryAccountName")
      resource.find_all(order_by: :delivery_account_name)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/CRM/QuotationHeaders?$select=DeliveryAccountName")
      resource.find_all(select: [:delivery_account_name])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/CRM/QuotationHeaders?$select=DeliveryAccountName")
      resource.find_by(select: [:delivery_account_name])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/CRM/QuotationHeaders?$select=DeliveryAccountName,ID")
      resource.find_all(select: [:delivery_account_name, :id])
    end
  end
end
