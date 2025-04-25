require 'spec_helper'

describe Elmas::GeneralLayout do
  it "can initialize" do
    general_layout = Elmas::GeneralLayout.new
    expect(general_layout).to be_a(Elmas::GeneralLayout)
  end

  it "accepts attribute setter" do
    general_layout = Elmas::GeneralLayout.new
    general_layout.category = "78238"
    expect(general_layout.category).to eq "78238"
  end

  it "returns value for getters" do
    general_layout = Elmas::GeneralLayout.new({ "Category" => "345" })
    expect(general_layout.category).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    general_layout = Elmas::GeneralLayout.new({ this_does_not_exist: "Piet" })
    expect(general_layout.try(:category)).to eq nil
  end



  let(:resource) { resource = Elmas::GeneralLayout.new(id: "12abcdef-1234-1234-1234-123456abcdef", category: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("general/Layouts(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("general/Layouts?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("general/Layouts?$filter=Category eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:category, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("general/Layouts?$orderby=Category&$filter=Category eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:category, :id], order_by: :category)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("general/Layouts?$orderby=Category")
      resource.find_all(order_by: :category)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("general/Layouts?$select=Category")
      resource.find_all(select: [:category])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("general/Layouts?$select=Category")
      resource.find_by(select: [:category])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("general/Layouts?$select=Category,ID")
      resource.find_all(select: [:category, :id])
    end
  end
end
