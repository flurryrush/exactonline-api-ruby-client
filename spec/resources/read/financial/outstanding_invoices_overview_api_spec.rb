require 'spec_helper'

describe Elmas::OutstandingInvoicesOverview do
  it "can initialize" do
    outstanding_invoices_overview = Elmas::OutstandingInvoicesOverview.new
    expect(outstanding_invoices_overview).to be_a(Elmas::OutstandingInvoicesOverview)
  end

  it "accepts attribute setter" do
    outstanding_invoices_overview = Elmas::OutstandingInvoicesOverview.new
    outstanding_invoices_overview.overdue_receivable_invoice_count = "78238"
    expect(outstanding_invoices_overview.overdue_receivable_invoice_count).to eq "78238"
  end

  it "returns value for getters" do
    outstanding_invoices_overview = Elmas::OutstandingInvoicesOverview.new({ "OverdueReceivableInvoiceCount" => "345" })
    expect(outstanding_invoices_overview.overdue_receivable_invoice_count).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    outstanding_invoices_overview = Elmas::OutstandingInvoicesOverview.new({ this_does_not_exist: "Piet" })
    expect(outstanding_invoices_overview.try(:overdue_receivable_invoice_count)).to eq nil
  end



  let(:resource) { resource = Elmas::OutstandingInvoicesOverview.new(id: "12abcdef-1234-1234-1234-123456abcdef", overdue_receivable_invoice_count: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/financial/OutstandingInvoicesOverview(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/financial/OutstandingInvoicesOverview?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/financial/OutstandingInvoicesOverview?$filter=OverdueReceivableInvoiceCount eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:overdue_receivable_invoice_count, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/financial/OutstandingInvoicesOverview?$orderby=OverdueReceivableInvoiceCount&$filter=OverdueReceivableInvoiceCount eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:overdue_receivable_invoice_count, :id], order_by: :overdue_receivable_invoice_count)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/financial/OutstandingInvoicesOverview?$orderby=OverdueReceivableInvoiceCount")
      resource.find_all(order_by: :overdue_receivable_invoice_count)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/OutstandingInvoicesOverview?$select=OverdueReceivableInvoiceCount")
      resource.find_all(select: [:overdue_receivable_invoice_count])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/financial/OutstandingInvoicesOverview?$select=OverdueReceivableInvoiceCount")
      resource.find_by(select: [:overdue_receivable_invoice_count])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/OutstandingInvoicesOverview?$select=OverdueReceivableInvoiceCount,ID")
      resource.find_all(select: [:overdue_receivable_invoice_count, :id])
    end
  end
end
