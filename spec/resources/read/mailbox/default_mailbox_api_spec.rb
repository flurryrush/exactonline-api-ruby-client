require 'spec_helper'

describe Elmas::DefaultMailbox do
  it "can initialize" do
    default_mailbox = Elmas::DefaultMailbox.new
    expect(default_mailbox).to be_a(Elmas::DefaultMailbox)
  end

  it "accepts attribute setter" do
    default_mailbox = Elmas::DefaultMailbox.new
    default_mailbox.modifier = "78238"
    expect(default_mailbox.modifier).to eq "78238"
  end

  it "returns value for getters" do
    default_mailbox = Elmas::DefaultMailbox.new({ "Modifier" => "345" })
    expect(default_mailbox.modifier).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    default_mailbox = Elmas::DefaultMailbox.new({ this_does_not_exist: "Piet" })
    expect(default_mailbox.try(:modifier)).to eq nil
  end



  let(:resource) { resource = Elmas::DefaultMailbox.new(id: "12abcdef-1234-1234-1234-123456abcdef", modifier: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/mailbox/DefaultMailbox(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/mailbox/DefaultMailbox?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/mailbox/DefaultMailbox?$filter=Modifier eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modifier, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/mailbox/DefaultMailbox?$orderby=Modifier&$filter=Modifier eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modifier, :id], order_by: :modifier)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/mailbox/DefaultMailbox?$orderby=Modifier")
      resource.find_all(order_by: :modifier)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/mailbox/DefaultMailbox?$select=Modifier")
      resource.find_all(select: [:modifier])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/mailbox/DefaultMailbox?$select=Modifier")
      resource.find_by(select: [:modifier])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/mailbox/DefaultMailbox?$select=Modifier,ID")
      resource.find_all(select: [:modifier, :id])
    end
  end
end
