require 'spec_helper'

describe "Special Serialization" do
  it "serializes SalesEntryLines gl_account and amount_fc to GLAccount and AmountFC" do
    sales_entry_line = Elmas::SalesEntryLine.new(amount_fc: "23", entry_id: "23299ask-2233", gl_account: "sdjkj29")
    hash = sales_entry_line.sanitize
    expect(hash).to have_key("AmountFC")
    expect(hash).to have_key("GLAccount")
    expect(hash).to have_key("EntryID")
  end

  it "serializes GLAccounts" do
    params = {
      assimilated_vat_box: "1",
      exclude_vat_listing: true,
      private_gl_account: "42",
      vat_code: "007",
      vat_gl_account_type: "none",
      vat_non_deductible_gl_account: "42",
      vat_non_deductible_percentage: "42",
      vat_system: "the system",
      year_end_cost_gl_account: "42"
    }
    gl_account = Elmas::GLAccount.new(params)
    hash = gl_account.sanitize
    expect(hash).to have_key("YearEndCostGLAccount")
    expect(hash).to have_key("VATSystem")
    expect(hash).to have_key("VATNonDeductiblePercentage")
    expect(hash).to have_key("VATNonDeductibleGLAccount")
    expect(hash).to have_key("VATGLAccountType")
    expect(hash).to have_key("VATCode")
    expect(hash).to have_key("PrivateGLAccount")
    expect(hash).to have_key("AssimilatedVATBox")
    expect(hash).to have_key("ExcludeVATListing")
  end
end
