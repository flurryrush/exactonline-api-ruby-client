require 'spec_helper'

describe Elmas::CostsById do
  it "can initialize" do
    costs_by_id = Elmas::CostsById.new
    expect(costs_by_id).to be_a(Elmas::CostsById)
  end

  it "accepts attribute setter" do
    costs_by_id = Elmas::CostsById.new
    costs_by_id.quantity_submitted = "78238"
    expect(costs_by_id.quantity_submitted).to eq "78238"
  end

  it "returns value for getters" do
    costs_by_id = Elmas::CostsById.new({ "QuantitySubmitted" => "345" })
    expect(costs_by_id.quantity_submitted).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    costs_by_id = Elmas::CostsById.new({ this_does_not_exist: "Piet" })
    expect(costs_by_id.try(:quantity_submitted)).to eq nil
  end



  let(:resource) { resource = Elmas::CostsById.new(id: "12abcdef-1234-1234-1234-123456abcdef", quantity_submitted: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/project/CostsById(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/project/CostsById?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/project/CostsById?$filter=QuantitySubmitted eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:quantity_submitted, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/project/CostsById?$orderby=QuantitySubmitted&$filter=QuantitySubmitted eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:quantity_submitted, :id], order_by: :quantity_submitted)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/project/CostsById?$orderby=QuantitySubmitted")
      resource.find_all(order_by: :quantity_submitted)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/CostsById?$select=QuantitySubmitted")
      resource.find_all(select: [:quantity_submitted])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/project/CostsById?$select=QuantitySubmitted")
      resource.find_by(select: [:quantity_submitted])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/project/CostsById?$select=QuantitySubmitted,ID")
      resource.find_all(select: [:quantity_submitted, :id])
    end
  end
end
