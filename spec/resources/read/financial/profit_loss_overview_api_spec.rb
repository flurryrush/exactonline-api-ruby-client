require 'spec_helper'

describe Elmas::ProfitLossOverview do
  it "can initialize" do
    profit_loss_overview = Elmas::ProfitLossOverview.new
    expect(profit_loss_overview).to be_a(Elmas::ProfitLossOverview)
  end

  it "accepts attribute setter" do
    profit_loss_overview = Elmas::ProfitLossOverview.new
    profit_loss_overview.result_previous_year = "78238"
    expect(profit_loss_overview.result_previous_year).to eq "78238"
  end

  it "returns value for getters" do
    profit_loss_overview = Elmas::ProfitLossOverview.new({ "ResultPreviousYear" => "345" })
    expect(profit_loss_overview.result_previous_year).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    profit_loss_overview = Elmas::ProfitLossOverview.new({ this_does_not_exist: "Piet" })
    expect(profit_loss_overview.try(:result_previous_year)).to eq nil
  end



  let(:resource) { resource = Elmas::ProfitLossOverview.new(id: "12abcdef-1234-1234-1234-123456abcdef", result_previous_year: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/financial/ProfitLossOverview(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/financial/ProfitLossOverview?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/financial/ProfitLossOverview?$filter=ResultPreviousYear eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:result_previous_year, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/financial/ProfitLossOverview?$orderby=ResultPreviousYear&$filter=ResultPreviousYear eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:result_previous_year, :id], order_by: :result_previous_year)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/financial/ProfitLossOverview?$orderby=ResultPreviousYear")
      resource.find_all(order_by: :result_previous_year)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/ProfitLossOverview?$select=ResultPreviousYear")
      resource.find_all(select: [:result_previous_year])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/financial/ProfitLossOverview?$select=ResultPreviousYear")
      resource.find_by(select: [:result_previous_year])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/financial/ProfitLossOverview?$select=ResultPreviousYear,ID")
      resource.find_all(select: [:result_previous_year, :id])
    end
  end
end
