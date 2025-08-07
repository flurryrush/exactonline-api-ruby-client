require 'spec_helper'

describe Elmas::Receivable do
  it "can initialize" do
    receivable = Elmas::Receivable.new
    expect(receivable).to be_a(Elmas::Receivable)
  end

  it "accepts attribute setter" do
    receivable = Elmas::Receivable.new
    receivable.amount_discount_dc = "78238"
    expect(receivable.amount_discount_dc).to eq "78238"
  end

  it "returns value for getters" do
    receivable = Elmas::Receivable.new({ "AmountDiscountDC" => "345" })
    expect(receivable.amount_discount_dc).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    receivable = Elmas::Receivable.new({ this_does_not_exist: "Piet" })
    expect(receivable.try(:amount_discount_dc)).to eq nil
  end



  let(:resource) { resource = Elmas::Receivable.new(id: "12abcdef-1234-1234-1234-123456abcdef", amount_discount_dc: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("cashflow/Receivables(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("cashflow/Receivables?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("cashflow/Receivables?$filter=AmountDiscountDC eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:amount_discount_dc, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("cashflow/Receivables?$orderby=AmountDiscountDC&$filter=AmountDiscountDC eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:amount_discount_dc, :id], order_by: :amount_discount_dc)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("cashflow/Receivables?$orderby=AmountDiscountDC")
      resource.find_all(order_by: :amount_discount_dc)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("cashflow/Receivables?$select=AmountDiscountDC")
      resource.find_all(select: [:amount_discount_dc])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("cashflow/Receivables?$select=AmountDiscountDC")
      resource.find_by(select: [:amount_discount_dc])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("cashflow/Receivables?$select=AmountDiscountDC,ID")
      resource.find_all(select: [:amount_discount_dc, :id])
    end
  end
end
