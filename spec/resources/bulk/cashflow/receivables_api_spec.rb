require 'spec_helper'

describe Elmas::BulkCashflowReceivable do
  it "can initialize" do
    bulk_cashflow_receivable = Elmas::BulkCashflowReceivable.new
    expect(bulk_cashflow_receivable).to be_a(Elmas::BulkCashflowReceivable)
  end

  it "accepts attribute setter" do
    bulk_cashflow_receivable = Elmas::BulkCashflowReceivable.new
    bulk_cashflow_receivable.end_to_end_id = "78238"
    expect(bulk_cashflow_receivable.end_to_end_id).to eq "78238"
  end

  it "returns value for getters" do
    bulk_cashflow_receivable = Elmas::BulkCashflowReceivable.new({ "EndToEndID" => "345" })
    expect(bulk_cashflow_receivable.end_to_end_id).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    bulk_cashflow_receivable = Elmas::BulkCashflowReceivable.new({ this_does_not_exist: "Piet" })
    expect(bulk_cashflow_receivable.try(:end_to_end_id)).to eq nil
  end



  let(:resource) { resource = Elmas::BulkCashflowReceivable.new(id: "12abcdef-1234-1234-1234-123456abcdef", end_to_end_id: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("bulk/Cashflow/Receivables(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("bulk/Cashflow/Receivables?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("bulk/Cashflow/Receivables?$filter=EndToEndID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:end_to_end_id, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("bulk/Cashflow/Receivables?$orderby=EndToEndID&$filter=EndToEndID eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:end_to_end_id, :id], order_by: :end_to_end_id)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("bulk/Cashflow/Receivables?$orderby=EndToEndID")
      resource.find_all(order_by: :end_to_end_id)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/Cashflow/Receivables?$select=EndToEndID")
      resource.find_all(select: [:end_to_end_id])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("bulk/Cashflow/Receivables?$select=EndToEndID")
      resource.find_by(select: [:end_to_end_id])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/Cashflow/Receivables?$select=EndToEndID,ID")
      resource.find_all(select: [:end_to_end_id, :id])
    end
  end
end
