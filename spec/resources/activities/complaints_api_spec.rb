require 'spec_helper'

describe Elmas::Complaint do
  it "can initialize" do
    complaint = Elmas::Complaint.new
    expect(complaint).to be_a(Elmas::Complaint)
  end

  it "accepts attribute setter" do
    complaint = Elmas::Complaint.new
    complaint.next_action = "78238"
    expect(complaint.next_action).to eq "78238"
  end

  it "returns value for getters" do
    complaint = Elmas::Complaint.new({ "NextAction" => "345" })
    expect(complaint.next_action).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    complaint = Elmas::Complaint.new({ this_does_not_exist: "Piet" })
    expect(complaint.try(:next_action)).to eq nil
  end



  let(:resource) { resource = Elmas::Complaint.new(id: "12abcdef-1234-1234-1234-123456abcdef", next_action: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("activities/Complaints(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("activities/Complaints?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("activities/Complaints?$filter=NextAction eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:next_action, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("activities/Complaints?$orderby=NextAction&$filter=NextAction eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:next_action, :id], order_by: :next_action)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("activities/Complaints?$orderby=NextAction")
      resource.find_all(order_by: :next_action)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("activities/Complaints?$select=NextAction")
      resource.find_all(select: [:next_action])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("activities/Complaints?$select=NextAction")
      resource.find_by(select: [:next_action])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("activities/Complaints?$select=NextAction,ID")
      resource.find_all(select: [:next_action, :id])
    end
  end
end
