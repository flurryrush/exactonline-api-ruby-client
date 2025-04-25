require 'spec_helper'

describe Elmas::DocumentFolder do
  it "can initialize" do
    document_folder = Elmas::DocumentFolder.new
    expect(document_folder).to be_a(Elmas::DocumentFolder)
  end

  it "accepts attribute setter" do
    document_folder = Elmas::DocumentFolder.new
    document_folder.creator_full_name = "78238"
    expect(document_folder.creator_full_name).to eq "78238"
  end

  it "returns value for getters" do
    document_folder = Elmas::DocumentFolder.new({ "CreatorFullName" => "345" })
    expect(document_folder.creator_full_name).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    document_folder = Elmas::DocumentFolder.new({ this_does_not_exist: "Piet" })
    expect(document_folder.try(:creator_full_name)).to eq nil
  end

  it "is valid with mandatory attributes" do
    document_folder = Elmas::DocumentFolder.new(code: "Code", description: "Description")
    expect(document_folder.valid?).to eq(true)
  end
  
  it "is not valid without mandatory attributes" do
    document_folder = Elmas::DocumentFolder.new
    expect(document_folder.valid?).to eq(false)
  end


  let(:resource) { resource = Elmas::DocumentFolder.new(id: "12abcdef-1234-1234-1234-123456abcdef", creator_full_name: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("documents/DocumentFolders(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("documents/DocumentFolders?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("documents/DocumentFolders?$filter=CreatorFullName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator_full_name, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("documents/DocumentFolders?$orderby=CreatorFullName&$filter=CreatorFullName eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:creator_full_name, :id], order_by: :creator_full_name)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("documents/DocumentFolders?$orderby=CreatorFullName")
      resource.find_all(order_by: :creator_full_name)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("documents/DocumentFolders?$select=CreatorFullName")
      resource.find_all(select: [:creator_full_name])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("documents/DocumentFolders?$select=CreatorFullName")
      resource.find_by(select: [:creator_full_name])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("documents/DocumentFolders?$select=CreatorFullName,ID")
      resource.find_all(select: [:creator_full_name, :id])
    end
  end
end
