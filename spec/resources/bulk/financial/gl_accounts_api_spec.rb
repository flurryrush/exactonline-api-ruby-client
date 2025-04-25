require 'spec_helper'

describe Elmas::BulkFinancialGLAccount do
  it "can initialize" do
    bulk_financial_gl_account = Elmas::BulkFinancialGLAccount.new
    expect(bulk_financial_gl_account).to be_a(Elmas::BulkFinancialGLAccount)
  end

  it "accepts attribute setter" do
    bulk_financial_gl_account = Elmas::BulkFinancialGLAccount.new
    bulk_financial_gl_account.vat_non_deductible_percentage = "78238"
    expect(bulk_financial_gl_account.vat_non_deductible_percentage).to eq "78238"
  end

  it "returns value for getters" do
    bulk_financial_gl_account = Elmas::BulkFinancialGLAccount.new({ "VATNonDeductiblePercentage" => "345" })
    expect(bulk_financial_gl_account.vat_non_deductible_percentage).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    bulk_financial_gl_account = Elmas::BulkFinancialGLAccount.new({ this_does_not_exist: "Piet" })
    expect(bulk_financial_gl_account.try(:vat_non_deductible_percentage)).to eq nil
  end

  it "is valid with mandatory attributes" do
    bulk_financial_gl_account = Elmas::BulkFinancialGLAccount.new(code: "Code", description: "Description")
    expect(bulk_financial_gl_account.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    bulk_financial_gl_account = Elmas::BulkFinancialGLAccount.new
    expect(bulk_financial_gl_account.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::BulkFinancialGLAccount.new(id: "12abcdef-1234-1234-1234-123456abcdef", vat_non_deductible_percentage: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("bulk/Financial/GLAccounts(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("bulk/Financial/GLAccounts?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("bulk/Financial/GLAccounts?$filter=VATNonDeductiblePercentage eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:vat_non_deductible_percentage, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("bulk/Financial/GLAccounts?$orderby=VATNonDeductiblePercentage&$filter=VATNonDeductiblePercentage eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:vat_non_deductible_percentage, :id], order_by: :vat_non_deductible_percentage)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("bulk/Financial/GLAccounts?$orderby=VATNonDeductiblePercentage")
      resource.find_all(order_by: :vat_non_deductible_percentage)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/Financial/GLAccounts?$select=VATNonDeductiblePercentage")
      resource.find_all(select: [:vat_non_deductible_percentage])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("bulk/Financial/GLAccounts?$select=VATNonDeductiblePercentage")
      resource.find_by(select: [:vat_non_deductible_percentage])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("bulk/Financial/GLAccounts?$select=VATNonDeductiblePercentage,ID")
      resource.find_all(select: [:vat_non_deductible_percentage, :id])
    end
  end
end
