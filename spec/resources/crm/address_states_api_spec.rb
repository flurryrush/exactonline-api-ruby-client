require 'spec_helper'

describe Elmas::AddressState do
  it "can initialize" do
    address_state = Elmas::AddressState.new
    expect(address_state).to be_a(Elmas::AddressState)
  end

  it "accepts attribute setter" do
    address_state = Elmas::AddressState.new
    address_state.state = "78238"
    expect(address_state.state).to eq "78238"
  end

  it "returns value for getters" do
    address_state = Elmas::AddressState.new({ "State" => "345" })
    expect(address_state.state).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    address_state = Elmas::AddressState.new({ this_does_not_exist: "Piet" })
    expect(address_state.try(:state)).to eq nil
  end



  let(:resource) { resource = Elmas::AddressState.new(id: "12abcdef-1234-1234-1234-123456abcdef", state: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("crm/AddressStates(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("crm/AddressStates?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("crm/AddressStates?$filter=State eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:state, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("crm/AddressStates?$orderby=State&$filter=State eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:state, :id], order_by: :state)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("crm/AddressStates?$orderby=State")
      resource.find_all(order_by: :state)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/AddressStates?$select=State")
      resource.find_all(select: [:state])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("crm/AddressStates?$select=State")
      resource.find_by(select: [:state])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("crm/AddressStates?$select=State,ID")
      resource.find_all(select: [:state, :id])
    end
  end
end
