class ItemCategoriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    @item_categories = ItemCategory.all
  end

  def new
    @item_category = ItemCategory.new
  end

  def edit
    @item_category = ItemCategory.find(params[:id])
  end

  def create
    @item_category = ItemCategory.new(item_category_params)

    respond_to do |format|
      if @item_category.save
        format.html { redirect_to item_category_url(@item_category), notice: "item_category was successfully created." }
        format.json { render :show, status: :created, location: @item_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item_category.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @item_category = ItemCategory.find(params[:id])

    if @item_category.update(item_category_params)
      redirect_to @item_category
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @item_category = ItemCategory.find(params[:id])

    @item_category.destroy

    redirect_to action: "index"
  end

  private
  # Only allow a list of trusted parameters through.
  def item_category_params
    params.require(:item_category).permit(:category_id, :item_id)
  end
end
