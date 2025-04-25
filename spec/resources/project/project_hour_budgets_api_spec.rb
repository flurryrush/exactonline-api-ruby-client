require 'spec_helper'

describe Elmas::ProjectHourBudget do
  it "can initialize" do
    project_hour_budget = Elmas::ProjectHourBudget.new
    expect(project_hour_budget).to be_a(Elmas::ProjectHourBudget)
  end

  it "accepts attribute setter" do
    project_hour_budget = Elmas::ProjectHourBudget.new
    project_hour_budget.division = "78238"
    expect(project_hour_budget.division).to eq "78238"
  end

  it "returns value for getters" do
    project_hour_budget = Elmas::ProjectHourBudget.new({ "Division" => "345" })
    expect(project_hour_budget.division).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    project_hour_budget = Elmas::ProjectHourBudget.new({ this_does_not_exist: "Piet" })
    expect(project_hour_budget.try(:division)).to eq nil
  end

  it "is valid with mandatory attributes" do
    project_hour_budget = Elmas::ProjectHourBudget.new(budget: "Budget", item: "Item", project: "Project")
    expect(project_hour_budget.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    project_hour_budget = Elmas::ProjectHourBudget.new
    expect(project_hour_budget.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ProjectHourBudget.new(id: "12abcdef-1234-1234-1234-123456abcdef", division: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("project/ProjectHourBudgets(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("project/ProjectHourBudgets?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("project/ProjectHourBudgets?$filter=Division eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:division, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("project/ProjectHourBudgets?$orderby=Division&$filter=Division eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:division, :id], order_by: :division)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("project/ProjectHourBudgets?$orderby=Division")
      resource.find_all(order_by: :division)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/ProjectHourBudgets?$select=Division")
      resource.find_all(select: [:division])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("project/ProjectHourBudgets?$select=Division")
      resource.find_by(select: [:division])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/ProjectHourBudgets?$select=Division,ID")
      resource.find_all(select: [:division, :id])
    end
  end
end
