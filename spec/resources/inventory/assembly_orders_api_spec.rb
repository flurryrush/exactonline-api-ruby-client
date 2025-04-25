require 'spec_helper'

describe Elmas::AssemblyOrder do
  it "can initialize" do
    assembly_order = Elmas::AssemblyOrder.new
    expect(assembly_order).to be_a(Elmas::AssemblyOrder)
  end

  it "accepts attribute setter" do
    assembly_order = Elmas::AssemblyOrder.new
    assembly_order.order_date = "78238"
    expect(assembly_order.order_date).to eq "78238"
  end

  it "returns value for getters" do
    assembly_order = Elmas::AssemblyOrder.new({ "OrderDate" => "345" })
    expect(assembly_order.order_date).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    assembly_order = Elmas::AssemblyOrder.new({ this_does_not_exist: "Piet" })
    expect(assembly_order.try(:order_date)).to eq nil
  end



  let(:resource) { resource = Elmas::AssemblyOrder.new(id: "12abcdef-1234-1234-1234-123456abcdef", order_date: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("inventory/AssemblyOrders(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("inventory/AssemblyOrders?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("inventory/AssemblyOrders?$filter=OrderDate eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:order_date, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("inventory/AssemblyOrders?$orderby=OrderDate&$filter=OrderDate eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:order_date, :id], order_by: :order_date)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("inventory/AssemblyOrders?$orderby=OrderDate")
      resource.find_all(order_by: :order_date)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/AssemblyOrders?$select=OrderDate")
      resource.find_all(select: [:order_date])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("inventory/AssemblyOrders?$select=OrderDate")
      resource.find_by(select: [:order_date])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("inventory/AssemblyOrders?$select=OrderDate,ID")
      resource.find_all(select: [:order_date, :id])
    end
  end
end
