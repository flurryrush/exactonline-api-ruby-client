require 'spec_helper'

describe Elmas::ProjectAccountMutation do
  it "can initialize" do
    project_account_mutation = Elmas::ProjectAccountMutation.new
    expect(project_account_mutation).to be_a(Elmas::ProjectAccountMutation)
  end

  it "accepts attribute setter" do
    project_account_mutation = Elmas::ProjectAccountMutation.new
    project_account_mutation.project_code = "78238"
    expect(project_account_mutation.project_code).to eq "78238"
  end

  it "returns value for getters" do
    project_account_mutation = Elmas::ProjectAccountMutation.new({ "ProjectCode" => "345" })
    expect(project_account_mutation.project_code).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    project_account_mutation = Elmas::ProjectAccountMutation.new({ this_does_not_exist: "Piet" })
    expect(project_account_mutation.try(:project_code)).to eq nil
  end

  it "is valid with mandatory attributes" do
    project_account_mutation = Elmas::ProjectAccountMutation.new(account: "Account", project: "Project", start_date: "StartDate")
    expect(project_account_mutation.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    project_account_mutation = Elmas::ProjectAccountMutation.new
    expect(project_account_mutation.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ProjectAccountMutation.new(id: "12abcdef-1234-1234-1234-123456abcdef", project_code: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("project/ProjectAccountMutations(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("project/ProjectAccountMutations?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("project/ProjectAccountMutations?$filter=ProjectCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:project_code, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("project/ProjectAccountMutations?$orderby=ProjectCode&$filter=ProjectCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:project_code, :id], order_by: :project_code)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("project/ProjectAccountMutations?$orderby=ProjectCode")
      resource.find_all(order_by: :project_code)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/ProjectAccountMutations?$select=ProjectCode")
      resource.find_all(select: [:project_code])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("project/ProjectAccountMutations?$select=ProjectCode")
      resource.find_by(select: [:project_code])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/ProjectAccountMutations?$select=ProjectCode,ID")
      resource.find_all(select: [:project_code, :id])
    end
  end
end
