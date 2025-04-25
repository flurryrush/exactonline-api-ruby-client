require 'spec_helper'

describe Elmas::WBSExpense do
  it "can initialize" do
    wbs_expense = Elmas::WBSExpense.new
    expect(wbs_expense).to be_a(Elmas::WBSExpense)
  end

  it "accepts attribute setter" do
    wbs_expense = Elmas::WBSExpense.new
    wbs_expense.modifier = "78238"
    expect(wbs_expense.modifier).to eq "78238"
  end

  it "returns value for getters" do
    wbs_expense = Elmas::WBSExpense.new({ "Modifier" => "345" })
    expect(wbs_expense.modifier).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    wbs_expense = Elmas::WBSExpense.new({ this_does_not_exist: "Piet" })
    expect(wbs_expense.try(:modifier)).to eq nil
  end

  it "is valid with mandatory attributes" do
    wbs_expense = Elmas::WBSExpense.new(description: "Description", project: "Project")
    expect(wbs_expense.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    wbs_expense = Elmas::WBSExpense.new
    expect(wbs_expense.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::WBSExpense.new(id: "12abcdef-1234-1234-1234-123456abcdef", modifier: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("project/WBSExpenses(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("project/WBSExpenses?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("project/WBSExpenses?$filter=Modifier eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modifier, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("project/WBSExpenses?$orderby=Modifier&$filter=Modifier eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modifier, :id], order_by: :modifier)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("project/WBSExpenses?$orderby=Modifier")
      resource.find_all(order_by: :modifier)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/WBSExpenses?$select=Modifier")
      resource.find_all(select: [:modifier])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("project/WBSExpenses?$select=Modifier")
      resource.find_by(select: [:modifier])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/WBSExpenses?$select=Modifier,ID")
      resource.find_all(select: [:modifier, :id])
    end
  end
end
