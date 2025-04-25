require 'spec_helper'

describe Elmas::CustomerItem do
  it "can initialize" do
    customer_item = Elmas::CustomerItem.new
    expect(customer_item).to be_a(Elmas::CustomerItem)
  end

  it "accepts attribute setter" do
    customer_item = Elmas::CustomerItem.new
    customer_item.modifier_full_name = "78238"
    expect(customer_item.modifier_full_name).to eq "78238"
  end

  it "returns value for getters" do
    customer_item = Elmas::CustomerItem.new({ "ModifierFullName" => "345" })
    expect(customer_item.modifier_full_name).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    customer_item = Elmas::CustomerItem.new({ this_does_not_exist: "Piet" })
    expect(customer_item.try(:modifier_full_name)).to eq nil
  end

  it "is valid with mandatory attributes" do
    customer_item = Elmas::CustomerItem.new(account: "Account", item: "Item")
    expect(customer_item.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    customer_item = Elmas::CustomerItem.new
    expect(customer_item.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::CustomerItem.new(id: "12abcdef-1234-1234-1234-123456abcdef", modifier_full_name: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("logistics/CustomerItems(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("logistics/CustomerItems?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("logistics/CustomerItems?$filter=ModifierFullName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modifier_full_name, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("logistics/CustomerItems?$orderby=ModifierFullName&$filter=ModifierFullName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modifier_full_name, :id], order_by: :modifier_full_name)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("logistics/CustomerItems?$orderby=ModifierFullName")
      resource.find_all(order_by: :modifier_full_name)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("logistics/CustomerItems?$select=ModifierFullName")
      resource.find_all(select: [:modifier_full_name])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("logistics/CustomerItems?$select=ModifierFullName")
      resource.find_by(select: [:modifier_full_name])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("logistics/CustomerItems?$select=ModifierFullName,ID")
      resource.find_all(select: [:modifier_full_name, :id])
    end
  end
end
