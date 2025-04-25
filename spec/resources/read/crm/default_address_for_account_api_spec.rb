require 'spec_helper'

describe Elmas::DefaultAddressForAccount do
  it "can initialize" do
    default_address_for_account = Elmas::DefaultAddressForAccount.new
    expect(default_address_for_account).to be_a(Elmas::DefaultAddressForAccount)
  end

  it "accepts attribute setter" do
    default_address_for_account = Elmas::DefaultAddressForAccount.new
    default_address_for_account.warehouse_description = "78238"
    expect(default_address_for_account.warehouse_description).to eq "78238"
  end

  it "returns value for getters" do
    default_address_for_account = Elmas::DefaultAddressForAccount.new({ "WarehouseDescription" => "345" })
    expect(default_address_for_account.warehouse_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    default_address_for_account = Elmas::DefaultAddressForAccount.new({ this_does_not_exist: "Piet" })
    expect(default_address_for_account.try(:warehouse_description)).to eq nil
  end



  let(:resource) { resource = Elmas::DefaultAddressForAccount.new(id: "12abcdef-1234-1234-1234-123456abcdef", warehouse_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/crm/DefaultAddressForAccount(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/crm/DefaultAddressForAccount?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/crm/DefaultAddressForAccount?$filter=WarehouseDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:warehouse_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/crm/DefaultAddressForAccount?$orderby=WarehouseDescription&$filter=WarehouseDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:warehouse_description, :id], order_by: :warehouse_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/crm/DefaultAddressForAccount?$orderby=WarehouseDescription")
      resource.find_all(order_by: :warehouse_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/crm/DefaultAddressForAccount?$select=WarehouseDescription")
      resource.find_all(select: [:warehouse_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/crm/DefaultAddressForAccount?$select=WarehouseDescription")
      resource.find_by(select: [:warehouse_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/crm/DefaultAddressForAccount?$select=WarehouseDescription,ID")
      resource.find_all(select: [:warehouse_description, :id])
    end
  end
end
