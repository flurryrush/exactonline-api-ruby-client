require 'spec_helper'

describe Elmas::DocumentType do
  it "can initialize" do
    document_type = Elmas::DocumentType.new
    expect(document_type).to be_a(Elmas::DocumentType)
  end

  it "accepts attribute setter" do
    document_type = Elmas::DocumentType.new
    document_type.type_category = "78238"
    expect(document_type.type_category).to eq "78238"
  end

  it "returns value for getters" do
    document_type = Elmas::DocumentType.new({ "TypeCategory" => "345" })
    expect(document_type.type_category).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    document_type = Elmas::DocumentType.new({ this_does_not_exist: "Piet" })
    expect(document_type.try(:type_category)).to eq nil
  end



  let(:resource) { resource = Elmas::DocumentType.new(id: "12abcdef-1234-1234-1234-123456abcdef", type_category: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("documents/DocumentTypes(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("documents/DocumentTypes?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("documents/DocumentTypes?$filter=TypeCategory eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:type_category, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("documents/DocumentTypes?$orderby=TypeCategory&$filter=TypeCategory eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:type_category, :id], order_by: :type_category)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("documents/DocumentTypes?$orderby=TypeCategory")
      resource.find_all(order_by: :type_category)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("documents/DocumentTypes?$select=TypeCategory")
      resource.find_all(select: [:type_category])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("documents/DocumentTypes?$select=TypeCategory")
      resource.find_by(select: [:type_category])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("documents/DocumentTypes?$select=TypeCategory,ID")
      resource.find_all(select: [:type_category, :id])
    end
  end
end
