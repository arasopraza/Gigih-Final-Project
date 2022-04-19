require 'rails_helper'

RSpec.describe ItemCategory, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:item_category)).to be_valid
  end

  it 'is valid with a menu_id and a category_id' do
    item_category = FactoryBot.build(:item_category)
    expect(item_category).to be_valid
  end

  it 'is invalid without a menu_id' do
    item_category = FactoryBot.build(:item_category, menu_id: nil)
    item_category.valid?
    expect(item_category.errors[:menu_id]).to include("can't be blank")
  end

  it 'is invalid without a category_id' do
    item_category = FactoryBot.build(:item_category, category_id: nil)
    item_category.valid?
    expect(item_category.errors[:category_id]).to include("can't be blank")
  end

  it 'should belong_to menu' do
      expect(ItemCategory.reflect_on_association(:menu).macro).to eq :belongs_to
  end

  it "should belong_to category" do
      expect(ItemCategory.reflect_on_association(:category).macro).to eq :belongs_to
  end
end
