require 'spec_helper'

describe Elmas::PurchaseEntryLine do
  it "can initialize" do
    purchase_entry_line = Elmas::PurchaseEntryLine.new
    expect(purchase_entry_line).to be_a(Elmas::PurchaseEntryLine)
  end

  it "accepts attribute setter" do
    purchase_entry_line = Elmas::PurchaseEntryLine.new
    purchase_entry_line.serial_number = "78238"
    expect(purchase_entry_line.serial_number).to eq "78238"
  end

  it "returns value for getters" do
    purchase_entry_line = Elmas::PurchaseEntryLine.new({ "AmountFC" => "345" })
    expect(purchase_entry_line.amount_fc).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    purchase_entry_line = Elmas::PurchaseEntryLine.new({ name: "Piet" })
    expect(purchase_entry_line.try(:amount_fc)).to eq nil
  end

  #customer journal GeneralJournalEntryLines
  it "is valid with mandatory attributes" do
    purchase_entry_line = Elmas::PurchaseEntryLine.new(amount_fc: "123", entry_id: "23299ask-2233", gl_account: "sdjkj29")
    expect(purchase_entry_line.valid?).to eq(true)
  end

  it "is not valid without mandatory attributes" do
    purchase_entry_line = Elmas::PurchaseEntryLine.new
    expect(purchase_entry_line.valid?).to eq(false)
  end

  let(:resource) { resource = Elmas::PurchaseEntryLine.new(id: "12abcdef-1234-1234-1234-123456abcdef", serial_number: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("purchaseentry/PurchaseEntryLines(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("purchaseentry/PurchaseEntryLines?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("purchaseentry/PurchaseEntryLines?$filter=SerialNumber eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:serial_number, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
      expect(Elmas).to receive(:get).with("purchaseentry/PurchaseEntryLines?$orderby=SerialNumber&$filter=SerialNumber eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:serial_number, :id], order_by: :serial_number)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("purchaseentry/PurchaseEntryLines?$orderby=SerialNumber")
      resource.find_all(order_by: :serial_number)
    end
  end

  context "Applying select" do
    it "should apply one select" do
      expect(Elmas).to receive(:get).with("purchaseentry/PurchaseEntryLines?$select=SerialNumber")
      resource.find_all(select: [:serial_number])
    end

    it "should apply one select with find_by" do
      expect(Elmas).to receive(:get).with("purchaseentry/PurchaseEntryLines?$select=SerialNumber")
      resource.find_by(select: [:serial_number])
    end

    it "should apply one select" do
      expect(Elmas).to receive(:get).with("purchaseentry/PurchaseEntryLines?$select=SerialNumber,ID")
      resource.find_all(select: [:serial_number, :id])
    end
  end
end
