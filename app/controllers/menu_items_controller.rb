class MenuItemsController < ApplicationController
    def index
      @menu_items = MenuItem.all
    end
  
    def show
      @menu_item = MenuItem.find(params[:id])
    end
  
    def new
      @menu_item = MenuItem.new
    end
  
    def edit
      @menu_item = MenuItem.find(params[:id])
    end
  
    def create
      @menu_item = MenuItem.new(menu_item_params)
  
      respond_to do |format|
        if @menu_item.save
          format.html { redirect_to menu_item_url(@menu_item), notice: "Menu was successfully created." }
          format.json { render :show, status: :created, location: @menu_item }
        else
          format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @menu_item.errors, status: :unprocessable_entity }
        end
      end
    end
    
    def update
      @menu_item = MenuItem.find(params[:id])
  
      if @menu_item.update(menu_item_params)
        redirect_to @menu_item
      else
        render :edit, status: :unprocessable_entity
      end
    end
    
    def destroy
      @menu_item = MenuItem.find(params[:id])
  
      @menu_item.destroy
  
      redirect_to action: "index"
    end
  
    private
    # Only allow a list of trusted parameters through.
    def menu_item_params
      params.require(:menu_item).permit(:name, :description, :price)
    end
  end
  