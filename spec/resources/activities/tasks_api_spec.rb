require 'spec_helper'

describe Elmas::Task do
  it "can initialize" do
    task = Elmas::Task.new
    expect(task).to be_a(Elmas::Task)
  end

  it "accepts attribute setter" do
    task = Elmas::Task.new
    task.document = "78238"
    expect(task.document).to eq "78238"
  end

  it "returns value for getters" do
    task = Elmas::Task.new({ "Document" => "345" })
    expect(task.document).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    task = Elmas::Task.new({ this_does_not_exist: "Piet" })
    expect(task.try(:document)).to eq nil
  end



  let(:resource) { resource = Elmas::Task.new(id: "12abcdef-1234-1234-1234-123456abcdef", document: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("activities/Tasks(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("activities/Tasks?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("activities/Tasks?$filter=Document eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:document, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("activities/Tasks?$orderby=Document&$filter=Document eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:document, :id], order_by: :document)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("activities/Tasks?$orderby=Document")
      resource.find_all(order_by: :document)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("activities/Tasks?$select=Document")
      resource.find_all(select: [:document])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("activities/Tasks?$select=Document")
      resource.find_by(select: [:document])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("activities/Tasks?$select=Document,ID")
      resource.find_all(select: [:document, :id])
    end
  end
end
