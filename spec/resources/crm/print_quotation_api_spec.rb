require 'spec_helper'

describe Elmas::PrintQuotation do
  it "can initialize" do
    print_quotation = Elmas::PrintQuotation.new
    expect(print_quotation).to be_a(Elmas::PrintQuotation)
  end

  it "accepts attribute setter" do
    print_quotation = Elmas::PrintQuotation.new
    print_quotation.extra_text = "78238"
    expect(print_quotation.extra_text).to eq "78238"
  end

  it "returns value for getters" do
    print_quotation = Elmas::PrintQuotation.new({ "ExtraText" => "345" })
    expect(print_quotation.extra_text).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    print_quotation = Elmas::PrintQuotation.new({ this_does_not_exist: "Piet" })
    expect(print_quotation.try(:extra_text)).to eq nil
  end

  it "is valid with mandatory attributes" do
    print_quotation = Elmas::PrintQuotation.new(quotation_id: "QuotationID")
    expect(print_quotation.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    print_quotation = Elmas::PrintQuotation.new
    expect(print_quotation.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::PrintQuotation.new(id: "12abcdef-1234-1234-1234-123456abcdef", extra_text: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("crm/PrintQuotation(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("crm/PrintQuotation?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("crm/PrintQuotation?$filter=ExtraText eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:extra_text, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("crm/PrintQuotation?$orderby=ExtraText&$filter=ExtraText eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:extra_text, :id], order_by: :extra_text)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("crm/PrintQuotation?$orderby=ExtraText")
      resource.find_all(order_by: :extra_text)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/PrintQuotation?$select=ExtraText")
      resource.find_all(select: [:extra_text])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("crm/PrintQuotation?$select=ExtraText")
      resource.find_by(select: [:extra_text])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/PrintQuotation?$select=ExtraText,ID")
      resource.find_all(select: [:extra_text, :id])
    end
  end
end
