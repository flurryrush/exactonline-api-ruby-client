require 'spec_helper'

describe Elmas::ProcessReturn do
  it "can initialize" do
    process_return = Elmas::ProcessReturn.new
    expect(process_return).to be_a(Elmas::ProcessReturn)
  end

  it "accepts attribute setter" do
    process_return = Elmas::ProcessReturn.new
    process_return.processed = "78238"
    expect(process_return.processed).to eq "78238"
  end

  it "returns value for getters" do
    process_return = Elmas::ProcessReturn.new({ "Processed" => "345" })
    expect(process_return.processed).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    process_return = Elmas::ProcessReturn.new({ this_does_not_exist: "Piet" })
    expect(process_return.try(:processed)).to eq nil
  end

  it "is valid with mandatory attributes" do
    process_return = Elmas::ProcessReturn.new(request: "Request", status: "Status")
    expect(process_return.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    process_return = Elmas::ProcessReturn.new
    expect(process_return.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::ProcessReturn.new(id: "12abcdef-1234-1234-1234-123456abcdef", processed: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("financial/ProcessReturn(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("financial/ProcessReturn?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("financial/ProcessReturn?$filter=Processed eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:processed, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("financial/ProcessReturn?$orderby=Processed&$filter=Processed eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:processed, :id], order_by: :processed)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("financial/ProcessReturn?$orderby=Processed")
      resource.find_all(order_by: :processed)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("financial/ProcessReturn?$select=Processed")
      resource.find_all(select: [:processed])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("financial/ProcessReturn?$select=Processed")
      resource.find_by(select: [:processed])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("financial/ProcessReturn?$select=Processed,ID")
      resource.find_all(select: [:processed, :id])
    end
  end
end
