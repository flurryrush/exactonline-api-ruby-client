require 'spec_helper'

describe Elmas::SyncSyncTimestamp do
  it "can initialize" do
    sync_sync_timestamp = Elmas::SyncSyncTimestamp.new
    expect(sync_sync_timestamp).to be_a(Elmas::SyncSyncTimestamp)
  end

  it "accepts attribute setter" do
    sync_sync_timestamp = Elmas::SyncSyncTimestamp.new
    sync_sync_timestamp.modified = "78238"
    expect(sync_sync_timestamp.modified).to eq "78238"
  end

  it "returns value for getters" do
    sync_sync_timestamp = Elmas::SyncSyncTimestamp.new({ "Modified" => "345" })
    expect(sync_sync_timestamp.modified).to eq "345"
  end

  it "crashes and burns when getting an unset attribute" do
    sync_sync_timestamp = Elmas::SyncSyncTimestamp.new({ this_does_not_exist: "Piet" })
    expect(sync_sync_timestamp.try(:modified)).to eq nil
  end



  let(:resource) { resource = Elmas::SyncSyncTimestamp.new(id: "12abcdef-1234-1234-1234-123456abcdef", modified: "1223") }

  context "Applying filters" do
    it "should apply ID filter for find" do
      expect(Elmas).to receive(:get).with("read/sync/Sync/SyncTimestamp(guid'12abcdef-1234-1234-1234-123456abcdef')?")
      resource.find
    end

    it "should apply no filters for find_all" do
      expect(Elmas).to receive(:get).with("read/sync/Sync/SyncTimestamp?")
      resource.find_all
    end

    it "should apply given filters for find_by" do
      expect(Elmas).to receive(:get).with("read/sync/Sync/SyncTimestamp?$filter=Modified eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modified, :id])
    end
  end

  context "Applying order" do
    it "should apply the order_by and filters" do
    expect(Elmas).to receive(:get).with("read/sync/Sync/SyncTimestamp?$orderby=Modified&$filter=Modified eq '1223'&$filter=ID eq guid'12abcdef-1234-1234-1234-123456abcdef'")
      resource.find_by(filters: [:modified, :id], order_by: :modified)
    end

    it "should only apply the order_by" do
      expect(Elmas).to receive(:get).with("read/sync/Sync/SyncTimestamp?$orderby=Modified")
      resource.find_all(order_by: :modified)
    end
  end

  context "Applying select" do
    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/sync/Sync/SyncTimestamp?$select=Modified")
      resource.find_all(select: [:modified])
    end

    it "should apply one select with find_by" do
    expect(Elmas).to receive(:get).with("read/sync/Sync/SyncTimestamp?$select=Modified")
      resource.find_by(select: [:modified])
    end

    it "should apply one select" do
    expect(Elmas).to receive(:get).with("read/sync/Sync/SyncTimestamp?$select=Modified,ID")
      resource.find_all(select: [:modified, :id])
    end
  end
end
