require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:order)).to be_valid
  end

  it 'is valid with a customer_id, total, order_date' do
    order = FactoryBot.build(:order)
    expect(order).to be_valid
  end

  it 'is invalid without a customer_id' do
    order = FactoryBot.build(:order, customer_id: nil)
    order.valid?
    expect(order.errors[:customer_id]).to include("can't be blank")
  end

  it 'is invalid without a total' do
    order = FactoryBot.build(:order, total: nil)
    order.valid?
    expect(order.errors[:total]).to include("can't be blank")
  end

  it 'is invalid without a order_date' do
    order = FactoryBot.build(:order, order_date: nil)
    order.valid?
    expect(order.errors[:order_date]).to include("can't be blank")
  end

  it 'is invalid with a non numeric values total' do
    order = FactoryBot.build(:order, total: 'Rp.5000')
    order.valid?
    expect(order.errors[:total]).to include("is not a number")
  end

  it "should belong_to customer" do
    expect(Order.reflect_on_association(:customer).macro).to eq :belongs_to
end
end
