require 'spec_helper'

describe Elmas::AccountItem do
  it "can initialize" do
    account_item = Elmas::AccountItem.new
    expect(account_item).to be_a(Elmas::AccountItem)
  end

  it "accepts attribute setter" do
    account_item = Elmas::AccountItem.new
    account_item.quantity_to_be_consumed = "78238"
    expect(account_item.quantity_to_be_consumed).to eq "78238"
  end

  it "returns value for getters" do
    account_item = Elmas::AccountItem.new({ "QuantityToBeConsumed" => "345" })
    expect(account_item.quantity_to_be_consumed).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    account_item = Elmas::AccountItem.new({ this_does_not_exist: "Piet" })
    expect(account_item.try(:quantity_to_be_consumed)).to eq nil
  end



  let(:resource) { resource = Elmas::AccountItem.new(id: "12abcdef-1234-1234-1234-123456abcdef", quantity_to_be_consumed: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/logistics/AccountItems(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/logistics/AccountItems?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/logistics/AccountItems?$filter=QuantityToBeConsumed eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:quantity_to_be_consumed, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/logistics/AccountItems?$orderby=QuantityToBeConsumed&$filter=QuantityToBeConsumed eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:quantity_to_be_consumed, :id], order_by: :quantity_to_be_consumed)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/logistics/AccountItems?$orderby=QuantityToBeConsumed")
      resource.find_all(order_by: :quantity_to_be_consumed)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/logistics/AccountItems?$select=QuantityToBeConsumed")
      resource.find_all(select: [:quantity_to_be_consumed])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/logistics/AccountItems?$select=QuantityToBeConsumed")
      resource.find_by(select: [:quantity_to_be_consumed])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/logistics/AccountItems?$select=QuantityToBeConsumed,ID")
      resource.find_all(select: [:quantity_to_be_consumed, :id])
    end
  end
end
