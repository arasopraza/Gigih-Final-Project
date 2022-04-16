require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:menu_item)).to be_valid
  end

  it 'is valid with a name and a description' do
    menu_item = FactoryBot.build(:menu_item)
    expect(menu_item).to be_valid
  end

  it 'is invalid without a name' do
    menu_item = FactoryBot.build(:menu_item, name: nil)
    menu_item.valid?
    expect(menu_item.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a description' do
    menu_item = FactoryBot.build(:menu_item, description: nil)
    menu_item.valid?
    expect(menu_item.errors[:description]).to include("can't be blank")
  end

  it 'is invalid with a non numeric values price' do
    menu_item = FactoryBot.build(:menu_item, price: 'Rp.5000')
    menu_item.valid?
    expect(menu_item.errors[:price]).to include("is not a number")
  end

  it 'is invalid with a price less than 0.01' do
    menu_item = FactoryBot.build(:menu_item, price: 0.002)
    menu_item.valid?
    expect(menu_item.errors[:price]).to include("must be greater than or equal to 0.01")
  end

  it 'is invalid with a name less than 2 words' do
    menu_item = FactoryBot.build(:menu_item, name: 'N')
    menu_item.valid?
    expect(menu_item.errors[:name]).to include("is too short (minimum is 2 characters)")
  end

  it 'is invalid with a duplicate name' do
    menu_item1 = FactoryBot.create(:menu_item, name: 'Nasi Uduk')
    menu_item2 = FactoryBot.build(:menu_item, name: 'Nasi Uduk')
    menu_item2.valid?
    expect(menu_item2.errors[:name]).to include("has already been taken")
  end

  it 'is invalid with a description more than 150 words' do
    menu_item = FactoryBot.build(:menu_item, description: 'You might be wondering, hey, I have not written any additional code, but the spec is green. Should I just skip this spec? While it is a valid question, we deem its necessary to keep this spec as it is a contract of our model: all Food should have a name and a description.')
    menu_item.valid?
    expect(menu_item.errors[:description]).to include("is too long (maximum is 150 characters)")
  end

  it"should have_many :item_categories" do
      expect(MenuItem.reflect_on_association(:item_categories).macro).to eq :has_many
  end
end
