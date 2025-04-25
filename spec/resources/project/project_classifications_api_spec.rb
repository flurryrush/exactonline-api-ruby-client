require 'spec_helper'

describe Elmas::ProjectClassification do
  it "can initialize" do
    project_classification = Elmas::ProjectClassification.new
    expect(project_classification).to be_a(Elmas::ProjectClassification)
  end

  it "accepts attribute setter" do
    project_classification = Elmas::ProjectClassification.new
    project_classification.modifier = "78238"
    expect(project_classification.modifier).to eq "78238"
  end

  it "returns value for getters" do
    project_classification = Elmas::ProjectClassification.new({ "Modifier" => "345" })
    expect(project_classification.modifier).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    project_classification = Elmas::ProjectClassification.new({ this_does_not_exist: "Piet" })
    expect(project_classification.try(:modifier)).to eq nil
  end

  it "is valid with mandatory attributes" do
    project_classification = Elmas::ProjectClassification.new(code: "Code", description: "Description")
    expect(project_classification.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    project_classification = Elmas::ProjectClassification.new
    expect(project_classification.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ProjectClassification.new(id: "12abcdef-1234-1234-1234-123456abcdef", modifier: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("project/ProjectClassifications(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("project/ProjectClassifications?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("project/ProjectClassifications?$filter=Modifier eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modifier, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("project/ProjectClassifications?$orderby=Modifier&$filter=Modifier eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modifier, :id], order_by: :modifier)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("project/ProjectClassifications?$orderby=Modifier")
      resource.find_all(order_by: :modifier)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/ProjectClassifications?$select=Modifier")
      resource.find_all(select: [:modifier])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("project/ProjectClassifications?$select=Modifier")
      resource.find_by(select: [:modifier])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("project/ProjectClassifications?$select=Modifier,ID")
      resource.find_all(select: [:modifier, :id])
    end
  end
end
