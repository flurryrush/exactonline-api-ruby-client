require 'spec_helper'

describe Elmas::JobTitle do
  it "can initialize" do
    job_title = Elmas::JobTitle.new
    expect(job_title).to be_a(Elmas::JobTitle)
  end

  it "accepts attribute setter" do
    job_title = Elmas::JobTitle.new
    job_title.created = "78238"
    expect(job_title.created).to eq "78238"
  end

  it "returns value for getters" do
    job_title = Elmas::JobTitle.new({ "Created" => "345" })
    expect(job_title.created).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    job_title = Elmas::JobTitle.new({ this_does_not_exist: "Piet" })
    expect(job_title.try(:created)).to eq nil
  end



  let(:resource) { resource = Elmas::JobTitle.new(id: "12abcdef-1234-1234-1234-123456abcdef", created: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("hrm/JobTitles(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("hrm/JobTitles?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("hrm/JobTitles?$filter=Created eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:created, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("hrm/JobTitles?$orderby=Created&$filter=Created eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:created, :id], order_by: :created)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("hrm/JobTitles?$orderby=Created")
      resource.find_all(order_by: :created)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("hrm/JobTitles?$select=Created")
      resource.find_all(select: [:created])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("hrm/JobTitles?$select=Created")
      resource.find_by(select: [:created])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("hrm/JobTitles?$select=Created,ID")
      resource.find_all(select: [:created, :id])
    end
  end
end
