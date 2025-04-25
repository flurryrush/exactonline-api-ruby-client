require 'spec_helper'

describe Elmas::ServiceRequest do
  it "can initialize" do
    service_request = Elmas::ServiceRequest.new
    expect(service_request).to be_a(Elmas::ServiceRequest)
  end

  it "accepts attribute setter" do
    service_request = Elmas::ServiceRequest.new
    service_request.status_description = "78238"
    expect(service_request.status_description).to eq "78238"
  end

  it "returns value for getters" do
    service_request = Elmas::ServiceRequest.new({ "StatusDescription" => "345" })
    expect(service_request.status_description).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    service_request = Elmas::ServiceRequest.new({ this_does_not_exist: "Piet" })
    expect(service_request.try(:status_description)).to eq nil
  end



  let(:resource) { resource = Elmas::ServiceRequest.new(id: "12abcdef-1234-1234-1234-123456abcdef", status_description: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("activities/ServiceRequests(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("activities/ServiceRequests?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("activities/ServiceRequests?$filter=StatusDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:status_description, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("activities/ServiceRequests?$orderby=StatusDescription&$filter=StatusDescription eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:status_description, :id], order_by: :status_description)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("activities/ServiceRequests?$orderby=StatusDescription")
      resource.find_all(order_by: :status_description)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("activities/ServiceRequests?$select=StatusDescription")
      resource.find_all(select: [:status_description])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("activities/ServiceRequests?$select=StatusDescription")
      resource.find_by(select: [:status_description])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("activities/ServiceRequests?$select=StatusDescription,ID")
      resource.find_all(select: [:status_description, :id])
    end
  end
end
