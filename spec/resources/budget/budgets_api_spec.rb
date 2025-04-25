require 'spec_helper'

describe Elmas::Budget do
  it "can initialize" do
    budget = Elmas::Budget.new
    expect(budget).to be_a(Elmas::Budget)
  end

  it "accepts attribute setter" do
    budget = Elmas::Budget.new
    budget.hid = "78238"
    expect(budget.hid).to eq "78238"
  end

  it "returns value for getters" do
    budget = Elmas::Budget.new({ "Hid" => "345" })
    expect(budget.hid).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    budget = Elmas::Budget.new({ this_does_not_exist: "Piet" })
    expect(budget.try(:hid)).to eq nil
  end

  it "is valid with mandatory attributes" do
    budget = Elmas::Budget.new(amount_dc: "AmountDc")
    expect(budget.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    budget = Elmas::Budget.new
    expect(budget.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::Budget.new(id: "12abcdef-1234-1234-1234-123456abcdef", hid: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("budget/Budgets(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("budget/Budgets?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("budget/Budgets?$filter=Hid eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:hid, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("budget/Budgets?$orderby=Hid&$filter=Hid eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:hid, :id], order_by: :hid)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("budget/Budgets?$orderby=Hid")
      resource.find_all(order_by: :hid)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("budget/Budgets?$select=Hid")
      resource.find_all(select: [:hid])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("budget/Budgets?$select=Hid")
      resource.find_by(select: [:hid])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("budget/Budgets?$select=Hid,ID")
      resource.find_all(select: [:hid, :id])
    end
  end
end
