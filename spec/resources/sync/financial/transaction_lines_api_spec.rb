require 'spec_helper'

describe Elmas::SyncFinancialTransactionLine do
  it "can initialize" do
    sync_financial_transaction_line = Elmas::SyncFinancialTransactionLine.new
    expect(sync_financial_transaction_line).to be_a(Elmas::SyncFinancialTransactionLine)
  end

  it "accepts attribute setter" do
    sync_financial_transaction_line = Elmas::SyncFinancialTransactionLine.new
    sync_financial_transaction_line.line_type = "78238"
    expect(sync_financial_transaction_line.line_type).to eq "78238"
  end

  it "returns value for getters" do
    sync_financial_transaction_line = Elmas::SyncFinancialTransactionLine.new({ "LineType" => "345" })
    expect(sync_financial_transaction_line.line_type).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_financial_transaction_line = Elmas::SyncFinancialTransactionLine.new({ this_does_not_exist: "Piet" })
    expect(sync_financial_transaction_line.try(:line_type)).to eq nil
  end

  it "is valid with mandatory attributes" do
    sync_financial_transaction_line = Elmas::SyncFinancialTransactionLine.new(entry_id: "EntryID")
    expect(sync_financial_transaction_line.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    sync_financial_transaction_line = Elmas::SyncFinancialTransactionLine.new
    expect(sync_financial_transaction_line.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::SyncFinancialTransactionLine.new(id: "12abcdef-1234-1234-1234-123456abcdef", line_type: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sync/Financial/TransactionLines(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sync/Financial/TransactionLines?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sync/Financial/TransactionLines?$filter=LineType eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:line_type, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sync/Financial/TransactionLines?$orderby=LineType&$filter=LineType eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:line_type, :id], order_by: :line_type)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sync/Financial/TransactionLines?$orderby=LineType")
      resource.find_all(order_by: :line_type)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Financial/TransactionLines?$select=LineType")
      resource.find_all(select: [:line_type])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sync/Financial/TransactionLines?$select=LineType")
      resource.find_by(select: [:line_type])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sync/Financial/TransactionLines?$select=LineType,ID")
      resource.find_all(select: [:line_type, :id])
    end
  end
end
