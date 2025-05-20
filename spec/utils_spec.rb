require 'spec_helper'

describe Elmas::Utils do
  it "camelizes a string" do
    expect(Elmas::Utils.camelize("a_class_boom")).to eq "AClassBoom"
  end

  it "camelizes a string with first letter downcase" do
    expect(Elmas::Utils.camelize("a_class_boom", false)).to eq "aClassBoom"
  end

  it "demodulizes a class name in a module" do
    expect(Elmas::Utils.demodulize("Module::Class")).to eq "Class"
  end

  it "pluralizes a word" do
    expect(Elmas::Utils.pluralize("Book")).to eq "Books"
  end

  it "doesn't double pluralize books to bookss" do
    expect(Elmas::Utils.pluralize("Books")).to eq "Books"
  end

  it "shows a collection path of a class name" do
    expect(Elmas::Utils.collection_path("Exact::User")).to eq "users"
  end

  it "camelizes special cases" do
    expect(Elmas::Utils.camelize("vat_number")).to eq "VATNumber"
    expect(Elmas::Utils.camelize("is_hr_division")).to eq "IsHRDivision"
    expect(Elmas::Utils.camelize("ob_number")).to eq "OBNumber"
    expect(Elmas::Utils.camelize("address_line1")).to eq "AddressLine1"
    expect(Elmas::Utils.camelize("closing_balance_fc")).to eq "ClosingBalanceFC"
    expect(Elmas::Utils.camelize("gl_account_purchase")).to eq "GLAccountPurchase"
    expect(Elmas::Utils.camelize("bsn")).to eq "BSN"
    expect(Elmas::Utils.camelize("quotation_id")).to eq "QuotationID"
    expect(Elmas::Utils.camelize("class_01")).to eq "Class_01"
  end

  let(:original_hash) do
    {
      "Module::Foo" => "bar",
      "module::class" => "bar",
      "ModuleOne::ClassTwo" => "bar"
    }
  end

  let(:normalized_hash) do
    {
      :"module/foo" => "bar",
      :"module/class" => "bar",
      :"module_one/class_two" => "bar"
    }
  end

  it "normalizes a hash" do
    expect(Elmas::Utils.normalize_hash(original_hash)).to eq(normalized_hash)
  end
end
