require 'spec_helper'

describe Elmas::CashEntry do
  it "can initialize" do
    cash_entry = Elmas::CashEntry.new
    expect(cash_entry).to be_a(Elmas::CashEntry)
  end

  it "accepts attribute setter" do
    cash_entry = Elmas::CashEntry.new
    cash_entry.custom_field = "78238"
    expect(cash_entry.custom_field).to eq "78238"
  end

  it "returns value for getters" do
    cash_entry = Elmas::CashEntry.new({ "CustomField" => "345" })
    expect(cash_entry.custom_field).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    cash_entry = Elmas::CashEntry.new({ this_does_not_exist: "Piet" })
    expect(cash_entry.try(:custom_field)).to eq nil
  end

  it "is valid with mandatory attributes" do
    cash_entry = Elmas::CashEntry.new(cash_entry_lines: "CashEntryLines", journal_code: "JournalCode")
    expect(cash_entry.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    cash_entry = Elmas::CashEntry.new
    expect(cash_entry.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::CashEntry.new(id: "12abcdef-1234-1234-1234-123456abcdef", custom_field: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("financialtransaction/CashEntries(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("financialtransaction/CashEntries?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("financialtransaction/CashEntries?$filter=CustomField eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:custom_field, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("financialtransaction/CashEntries?$orderby=CustomField&$filter=CustomField eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:custom_field, :id], order_by: :custom_field)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("financialtransaction/CashEntries?$orderby=CustomField")
      resource.find_all(order_by: :custom_field)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("financialtransaction/CashEntries?$select=CustomField")
      resource.find_all(select: [:custom_field])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("financialtransaction/CashEntries?$select=CustomField")
      resource.find_by(select: [:custom_field])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("financialtransaction/CashEntries?$select=CustomField,ID")
      resource.find_all(select: [:custom_field, :id])
    end
  end
end
