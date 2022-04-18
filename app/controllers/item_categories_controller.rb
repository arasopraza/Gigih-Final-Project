class ItemCategoriesController < ApplicationController
  def index
    @item_categories = ItemCategory.all
    render json: @item_categories
  end
end
