require 'spec_helper'

describe Elmas::Me do
  it "can initialize" do
    me = Elmas::Me.new
    expect(me).to be_a(Elmas::Me)
  end

  it "accepts attribute setter" do
    me = Elmas::Me.new
    me.first_name = "78238"
    expect(me.first_name).to eq "78238"
  end

  it "returns value for getters" do
    me = Elmas::Me.new({ "FirstName" => "345" })
    expect(me.first_name).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    me = Elmas::Me.new({ this_does_not_exist: "Piet" })
    expect(me.try(:first_name)).to eq nil
  end



  let(:resource) { resource = Elmas::Me.new(id: "12abcdef-1234-1234-1234-123456abcdef", first_name: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("current/Me(guid'12abcdef-1234-1234-1234-123456abcdef')?", { no_division: true })
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("current/Me?", { no_division: true })
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("current/Me?$filter=FirstName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'", { no_division: true })
      resource.find_by(filters: [:first_name, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("current/Me?$orderby=FirstName&$filter=FirstName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'", { no_division: true })
      resource.find_by(filters: [:first_name, :id], order_by: :first_name)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("current/Me?$orderby=FirstName", { no_division: true })
      resource.find_all(order_by: :first_name)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("current/Me?$select=FirstName", { no_division: true })
      resource.find_all(select: [:first_name])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("current/Me?$select=FirstName", { no_division: true })
      resource.find_by(select: [:first_name])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("current/Me?$select=FirstName,ID", { no_division: true })
      resource.find_all(select: [:first_name, :id])
    end
  end
end
