require 'spec_helper'

describe Elmas::GLTransactionType do
  it "can initialize" do
    gl_transaction_type = Elmas::GLTransactionType.new
    expect(gl_transaction_type).to be_a(Elmas::GLTransactionType)
  end

  it "accepts attribute setter" do
    gl_transaction_type = Elmas::GLTransactionType.new
    gl_transaction_type.description_suffix = "78238"
    expect(gl_transaction_type.description_suffix).to eq "78238"
  end

  it "returns value for getters" do
    gl_transaction_type = Elmas::GLTransactionType.new({ "DescriptionSuffix" => "345" })
    expect(gl_transaction_type.description_suffix).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    gl_transaction_type = Elmas::GLTransactionType.new({ this_does_not_exist: "Piet" })
    expect(gl_transaction_type.try(:description_suffix)).to eq nil
  end



  let(:resource) { resource = Elmas::GLTransactionType.new(id: "12abcdef-1234-1234-1234-123456abcdef", description_suffix: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("financial/GLTransactionTypes(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("financial/GLTransactionTypes?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("financial/GLTransactionTypes?$filter=DescriptionSuffix eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:description_suffix, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("financial/GLTransactionTypes?$orderby=DescriptionSuffix&$filter=DescriptionSuffix eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:description_suffix, :id], order_by: :description_suffix)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("financial/GLTransactionTypes?$orderby=DescriptionSuffix")
      resource.find_all(order_by: :description_suffix)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("financial/GLTransactionTypes?$select=DescriptionSuffix")
      resource.find_all(select: [:description_suffix])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("financial/GLTransactionTypes?$select=DescriptionSuffix")
      resource.find_by(select: [:description_suffix])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("financial/GLTransactionTypes?$select=DescriptionSuffix,ID")
      resource.find_all(select: [:description_suffix, :id])
    end
  end
end
