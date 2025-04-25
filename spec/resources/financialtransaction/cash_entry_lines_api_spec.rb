require 'spec_helper'

describe Elmas::CashEntryLine do
  it "can initialize" do
    cash_entry_line = Elmas::CashEntryLine.new
    expect(cash_entry_line).to be_a(Elmas::CashEntryLine)
  end

  it "accepts attribute setter" do
    cash_entry_line = Elmas::CashEntryLine.new
    cash_entry_line.creator_full_name = "78238"
    expect(cash_entry_line.creator_full_name).to eq "78238"
  end

  it "returns value for getters" do
    cash_entry_line = Elmas::CashEntryLine.new({ "CreatorFullName" => "345" })
    expect(cash_entry_line.creator_full_name).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    cash_entry_line = Elmas::CashEntryLine.new({ this_does_not_exist: "Piet" })
    expect(cash_entry_line.try(:creator_full_name)).to eq nil
  end

  it "is valid with mandatory attributes" do
    cash_entry_line = Elmas::CashEntryLine.new(amount_fc: "AmountFC", entry_id: "EntryID", gl_account: "GLAccount")
    expect(cash_entry_line.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    cash_entry_line = Elmas::CashEntryLine.new
    expect(cash_entry_line.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::CashEntryLine.new(id: "12abcdef-1234-1234-1234-123456abcdef", creator_full_name: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("financialtransaction/CashEntryLines(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("financialtransaction/CashEntryLines?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("financialtransaction/CashEntryLines?$filter=CreatorFullName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator_full_name, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("financialtransaction/CashEntryLines?$orderby=CreatorFullName&$filter=CreatorFullName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator_full_name, :id], order_by: :creator_full_name)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("financialtransaction/CashEntryLines?$orderby=CreatorFullName")
      resource.find_all(order_by: :creator_full_name)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("financialtransaction/CashEntryLines?$select=CreatorFullName")
      resource.find_all(select: [:creator_full_name])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("financialtransaction/CashEntryLines?$select=CreatorFullName")
      resource.find_by(select: [:creator_full_name])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("financialtransaction/CashEntryLines?$select=CreatorFullName,ID")
      resource.find_all(select: [:creator_full_name, :id])
    end
  end
end
