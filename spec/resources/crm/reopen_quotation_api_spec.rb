require 'spec_helper'

describe Elmas::ReopenQuotation do
  it "can initialize" do
    reopen_quotation = Elmas::ReopenQuotation.new
    expect(reopen_quotation).to be_a(Elmas::ReopenQuotation)
  end

  it "accepts attribute setter" do
    reopen_quotation = Elmas::ReopenQuotation.new
    reopen_quotation.division = "78238"
    expect(reopen_quotation.division).to eq "78238"
  end

  it "returns value for getters" do
    reopen_quotation = Elmas::ReopenQuotation.new({ "Division" => "345" })
    expect(reopen_quotation.division).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    reopen_quotation = Elmas::ReopenQuotation.new({ this_does_not_exist: "Piet" })
    expect(reopen_quotation.try(:division)).to eq nil
  end

  it "is valid with mandatory attributes" do
    reopen_quotation = Elmas::ReopenQuotation.new(quotation_id: "QuotationID")
    expect(reopen_quotation.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    reopen_quotation = Elmas::ReopenQuotation.new
    expect(reopen_quotation.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ReopenQuotation.new(id: "12abcdef-1234-1234-1234-123456abcdef", division: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("crm/ReopenQuotation(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("crm/ReopenQuotation?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("crm/ReopenQuotation?$filter=Division eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:division, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("crm/ReopenQuotation?$orderby=Division&$filter=Division eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:division, :id], order_by: :division)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("crm/ReopenQuotation?$orderby=Division")
      resource.find_all(order_by: :division)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/ReopenQuotation?$select=Division")
      resource.find_all(select: [:division])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("crm/ReopenQuotation?$select=Division")
      resource.find_by(select: [:division])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/ReopenQuotation?$select=Division,ID")
      resource.find_all(select: [:division, :id])
    end
  end
end
