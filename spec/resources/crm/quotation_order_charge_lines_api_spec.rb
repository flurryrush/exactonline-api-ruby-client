require 'spec_helper'

describe Elmas::QuotationOrderChargeLine do
  it "can initialize" do
    quotation_order_charge_line = Elmas::QuotationOrderChargeLine.new
    expect(quotation_order_charge_line).to be_a(Elmas::QuotationOrderChargeLine)
  end

  it "accepts attribute setter" do
    quotation_order_charge_line = Elmas::QuotationOrderChargeLine.new
    quotation_order_charge_line.amount_fc_incl_vat = "78238"
    expect(quotation_order_charge_line.amount_fc_incl_vat).to eq "78238"
  end

  it "returns value for getters" do
    quotation_order_charge_line = Elmas::QuotationOrderChargeLine.new({ "AmountFCInclVAT" => "345" })
    expect(quotation_order_charge_line.amount_fc_incl_vat).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    quotation_order_charge_line = Elmas::QuotationOrderChargeLine.new({ this_does_not_exist: "Piet" })
    expect(quotation_order_charge_line.try(:amount_fc_incl_vat)).to eq nil
  end

  it "is valid with mandatory attributes" do
    quotation_order_charge_line = Elmas::QuotationOrderChargeLine.new(quotation_id: "QuotationID")
    expect(quotation_order_charge_line.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    quotation_order_charge_line = Elmas::QuotationOrderChargeLine.new
    expect(quotation_order_charge_line.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::QuotationOrderChargeLine.new(id: "12abcdef-1234-1234-1234-123456abcdef", amount_fc_incl_vat: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("crm/QuotationOrderChargeLines(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("crm/QuotationOrderChargeLines?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("crm/QuotationOrderChargeLines?$filter=AmountFCInclVAT eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:amount_fc_incl_vat, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("crm/QuotationOrderChargeLines?$orderby=AmountFCInclVAT&$filter=AmountFCInclVAT eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:amount_fc_incl_vat, :id], order_by: :amount_fc_incl_vat)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("crm/QuotationOrderChargeLines?$orderby=AmountFCInclVAT")
      resource.find_all(order_by: :amount_fc_incl_vat)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/QuotationOrderChargeLines?$select=AmountFCInclVAT")
      resource.find_all(select: [:amount_fc_incl_vat])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("crm/QuotationOrderChargeLines?$select=AmountFCInclVAT")
      resource.find_by(select: [:amount_fc_incl_vat])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/QuotationOrderChargeLines?$select=AmountFCInclVAT,ID")
      resource.find_all(select: [:amount_fc_incl_vat, :id])
    end
  end
end
