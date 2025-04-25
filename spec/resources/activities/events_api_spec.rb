require 'spec_helper'

describe Elmas::Event do
  it "can initialize" do
    event = Elmas::Event.new
    expect(event).to be_a(Elmas::Event)
  end

  it "accepts attribute setter" do
    event = Elmas::Event.new
    event.project_description = "78238"
    expect(event.project_description).to eq "78238"
  end

  it "returns value for getters" do
    event = Elmas::Event.new({ "ProjectDescription" => "345" })
    expect(event.project_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    event = Elmas::Event.new({ this_does_not_exist: "Piet" })
    expect(event.try(:project_description)).to eq nil
  end



  let(:resource) { resource = Elmas::Event.new(id: "12abcdef-1234-1234-1234-123456abcdef", project_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("activities/Events(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("activities/Events?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("activities/Events?$filter=ProjectDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:project_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("activities/Events?$orderby=ProjectDescription&$filter=ProjectDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:project_description, :id], order_by: :project_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("activities/Events?$orderby=ProjectDescription")
      resource.find_all(order_by: :project_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("activities/Events?$select=ProjectDescription")
      resource.find_all(select: [:project_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("activities/Events?$select=ProjectDescription")
      resource.find_by(select: [:project_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("activities/Events?$select=ProjectDescription,ID")
      resource.find_all(select: [:project_description, :id])
    end
  end
end
