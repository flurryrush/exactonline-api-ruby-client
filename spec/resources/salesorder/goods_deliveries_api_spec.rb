require 'spec_helper'

describe Elmas::GoodsDelivery do
  it "can initialize" do
    goods_delivery = Elmas::GoodsDelivery.new
    expect(goods_delivery).to be_a(Elmas::GoodsDelivery)
  end

  it "accepts attribute setter" do
    goods_delivery = Elmas::GoodsDelivery.new
    goods_delivery.tracking_number = "9999 9999 9999"
    expect(goods_delivery.tracking_number).to eq "9999 9999 9999"
  end

  it "returns value for getters" do
    goods_delivery = Elmas::GoodsDelivery.new({ tracking_number: "9999 9999 9999" })
    expect(goods_delivery.tracking_number).to eq "9999 9999 9999"
  end

  it "crashes and burns when getting an unset attribute" do
    goods_delivery = Elmas::GoodsDelivery.new({ tracking_number: "9999 9999 9999" })
    expect(goods_delivery.try(:shipping_method_code)).to eq nil
  end

  it "does not allow to set an invalid attribute" do
    goods_delivery = Elmas::GoodsDelivery.new
    goods_delivery.airplane = "Boeing 777"
    expect(goods_delivery.airplaine).to eq nil
  end
end
