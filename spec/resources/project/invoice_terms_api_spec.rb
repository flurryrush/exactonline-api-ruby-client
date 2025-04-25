require 'spec_helper'

describe Elmas::InvoiceTerm do
  it "can initialize" do
    invoice_term = Elmas::InvoiceTerm.new
    expect(invoice_term).to be_a(Elmas::InvoiceTerm)
  end

  it "accepts attribute setter" do
    invoice_term = Elmas::InvoiceTerm.new
    invoice_term.notes = "78238"
    expect(invoice_term.notes).to eq "78238"
  end

  it "returns value for getters" do
    invoice_term = Elmas::InvoiceTerm.new({ "Notes" => "345" })
    expect(invoice_term.notes).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    invoice_term = Elmas::InvoiceTerm.new({ this_does_not_exist: "Piet" })
    expect(invoice_term.try(:notes)).to eq nil
  end

  it "is valid with mandatory attributes" do
    invoice_term = Elmas::InvoiceTerm.new(amount: "Amount", project: "Project")
    expect(invoice_term.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    invoice_term = Elmas::InvoiceTerm.new
    expect(invoice_term.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::InvoiceTerm.new(id: "12abcdef-1234-1234-1234-123456abcdef", notes: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("project/InvoiceTerms(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("project/InvoiceTerms?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("project/InvoiceTerms?$filter=Notes eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:notes, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("project/InvoiceTerms?$orderby=Notes&$filter=Notes eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:notes, :id], order_by: :notes)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("project/InvoiceTerms?$orderby=Notes")
      resource.find_all(order_by: :notes)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/InvoiceTerms?$select=Notes")
      resource.find_all(select: [:notes])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("project/InvoiceTerms?$select=Notes")
      resource.find_by(select: [:notes])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/InvoiceTerms?$select=Notes,ID")
      resource.find_all(select: [:notes, :id])
    end
  end
end
