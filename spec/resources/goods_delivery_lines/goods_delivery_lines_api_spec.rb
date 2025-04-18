require 'spec_helper'

describe Elmas::GoodsDeliveryLine do
  it "can initialize" do
    goods_delivery_line = Elmas::GoodsDeliveryLine.new
    expect(goods_delivery_line).to be_a(Elmas::GoodsDeliveryLine)
  end

  it "accepts attribute setter" do
    goods_delivery_line = Elmas::GoodsDeliveryLine.new
    goods_delivery_line.tracking_number = "9999 9999 9999"
    expect(goods_delivery_line.tracking_number).to eq "9999 9999 9999"
  end

  it "returns value for getters" do
    goods_delivery_line = Elmas::GoodsDeliveryLine.new({ tracking_number: "9999 9999 9999" })
    expect(goods_delivery_line.tracking_number).to eq "9999 9999 9999"
  end

end
