require 'spec_helper'

describe Elmas::AcceptQuotation do
  it "can initialize" do
    accept_quotation = Elmas::AcceptQuotation.new
    expect(accept_quotation).to be_a(Elmas::AcceptQuotation)
  end

  it "accepts attribute setter" do
    accept_quotation = Elmas::AcceptQuotation.new
    accept_quotation.project_invoicing_action = "78238"
    expect(accept_quotation.project_invoicing_action).to eq "78238"
  end

  it "returns value for getters" do
    accept_quotation = Elmas::AcceptQuotation.new({ "ProjectInvoicingAction" => "345" })
    expect(accept_quotation.project_invoicing_action).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    accept_quotation = Elmas::AcceptQuotation.new({ this_does_not_exist: "Piet" })
    expect(accept_quotation.try(:project_invoicing_action)).to eq nil
  end

  it "is valid with mandatory attributes" do
    accept_quotation = Elmas::AcceptQuotation.new(quotation_id: "QuotationID")
    expect(accept_quotation.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    accept_quotation = Elmas::AcceptQuotation.new
    expect(accept_quotation.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::AcceptQuotation.new(id: "12abcdef-1234-1234-1234-123456abcdef", project_invoicing_action: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("crm/AcceptQuotation(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("crm/AcceptQuotation?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("crm/AcceptQuotation?$filter=ProjectInvoicingAction eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:project_invoicing_action, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("crm/AcceptQuotation?$orderby=ProjectInvoicingAction&$filter=ProjectInvoicingAction eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:project_invoicing_action, :id], order_by: :project_invoicing_action)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("crm/AcceptQuotation?$orderby=ProjectInvoicingAction")
      resource.find_all(order_by: :project_invoicing_action)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/AcceptQuotation?$select=ProjectInvoicingAction")
      resource.find_all(select: [:project_invoicing_action])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("crm/AcceptQuotation?$select=ProjectInvoicingAction")
      resource.find_by(select: [:project_invoicing_action])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/AcceptQuotation?$select=ProjectInvoicingAction,ID")
      resource.find_all(select: [:project_invoicing_action, :id])
    end
  end
end
