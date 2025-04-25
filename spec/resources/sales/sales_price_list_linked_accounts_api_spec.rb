require 'spec_helper'

describe Elmas::SalesPriceListLinkedAccount do
  it "can initialize" do
    sales_price_list_linked_account = Elmas::SalesPriceListLinkedAccount.new
    expect(sales_price_list_linked_account).to be_a(Elmas::SalesPriceListLinkedAccount)
  end

  it "accepts attribute setter" do
    sales_price_list_linked_account = Elmas::SalesPriceListLinkedAccount.new
    sales_price_list_linked_account.created = "78238"
    expect(sales_price_list_linked_account.created).to eq "78238"
  end

  it "returns value for getters" do
    sales_price_list_linked_account = Elmas::SalesPriceListLinkedAccount.new({ "Created" => "345" })
    expect(sales_price_list_linked_account.created).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sales_price_list_linked_account = Elmas::SalesPriceListLinkedAccount.new({ this_does_not_exist: "Piet" })
    expect(sales_price_list_linked_account.try(:created)).to eq nil
  end



  let(:resource) { resource = Elmas::SalesPriceListLinkedAccount.new(id: "12abcdef-1234-1234-1234-123456abcdef", created: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("sales/SalesPriceListLinkedAccounts(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("sales/SalesPriceListLinkedAccounts?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("sales/SalesPriceListLinkedAccounts?$filter=Created eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:created, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("sales/SalesPriceListLinkedAccounts?$orderby=Created&$filter=Created eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:created, :id], order_by: :created)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("sales/SalesPriceListLinkedAccounts?$orderby=Created")
      resource.find_all(order_by: :created)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sales/SalesPriceListLinkedAccounts?$select=Created")
      resource.find_all(select: [:created])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("sales/SalesPriceListLinkedAccounts?$select=Created")
      resource.find_by(select: [:created])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("sales/SalesPriceListLinkedAccounts?$select=Created,ID")
      resource.find_all(select: [:created, :id])
    end
  end
end
