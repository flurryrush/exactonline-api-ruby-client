require 'spec_helper'

describe Elmas::DocumentTypeFolder do
  it "can initialize" do
    document_type_folder = Elmas::DocumentTypeFolder.new
    expect(document_type_folder).to be_a(Elmas::DocumentTypeFolder)
  end

  it "accepts attribute setter" do
    document_type_folder = Elmas::DocumentTypeFolder.new
    document_type_folder.document_folder = "78238"
    expect(document_type_folder.document_folder).to eq "78238"
  end

  it "returns value for getters" do
    document_type_folder = Elmas::DocumentTypeFolder.new({ "DocumentFolder" => "345" })
    expect(document_type_folder.document_folder).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    document_type_folder = Elmas::DocumentTypeFolder.new({ this_does_not_exist: "Piet" })
    expect(document_type_folder.try(:document_folder)).to eq nil
  end



  let(:resource) { resource = Elmas::DocumentTypeFolder.new(id: "12abcdef-1234-1234-1234-123456abcdef", document_folder: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("documents/DocumentTypeFolders(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("documents/DocumentTypeFolders?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("documents/DocumentTypeFolders?$filter=DocumentFolder eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:document_folder, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("documents/DocumentTypeFolders?$orderby=DocumentFolder&$filter=DocumentFolder eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:document_folder, :id], order_by: :document_folder)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("documents/DocumentTypeFolders?$orderby=DocumentFolder")
      resource.find_all(order_by: :document_folder)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("documents/DocumentTypeFolders?$select=DocumentFolder")
      resource.find_all(select: [:document_folder])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("documents/DocumentTypeFolders?$select=DocumentFolder")
      resource.find_by(select: [:document_folder])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("documents/DocumentTypeFolders?$select=DocumentFolder,ID")
      resource.find_all(select: [:document_folder, :id])
    end
  end
end
