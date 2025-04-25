require 'spec_helper'

describe Elmas::CurrentYearProcessed do
  it "can initialize" do
    current_year_processed = Elmas::CurrentYearProcessed.new
    expect(current_year_processed).to be_a(Elmas::CurrentYearProcessed)
  end

  it "accepts attribute setter" do
    current_year_processed = Elmas::CurrentYearProcessed.new
    current_year_processed.gl_account_code = "78238"
    expect(current_year_processed.gl_account_code).to eq "78238"
  end

  it "returns value for getters" do
    current_year_processed = Elmas::CurrentYearProcessed.new({ "GLAccountCode" => "345" })
    expect(current_year_processed.gl_account_code).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    current_year_processed = Elmas::CurrentYearProcessed.new({ this_does_not_exist: "Piet" })
    expect(current_year_processed.try(:gl_account_code)).to eq nil
  end



  let(:resource) { resource = Elmas::CurrentYearProcessed.new(id: "12abcdef-1234-1234-1234-123456abcdef", gl_account_code: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("openingbalance/CurrentYear/Processed(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("openingbalance/CurrentYear/Processed?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("openingbalance/CurrentYear/Processed?$filter=GLAccountCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:gl_account_code, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("openingbalance/CurrentYear/Processed?$orderby=GLAccountCode&$filter=GLAccountCode eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:gl_account_code, :id], order_by: :gl_account_code)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("openingbalance/CurrentYear/Processed?$orderby=GLAccountCode")
      resource.find_all(order_by: :gl_account_code)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("openingbalance/CurrentYear/Processed?$select=GLAccountCode")
      resource.find_all(select: [:gl_account_code])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("openingbalance/CurrentYear/Processed?$select=GLAccountCode")
      resource.find_by(select: [:gl_account_code])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("openingbalance/CurrentYear/Processed?$select=GLAccountCode,ID")
      resource.find_all(select: [:gl_account_code, :id])
    end
  end
end
