class MenusController < ApplicationController
    def index
      @menus = Menu.all
    end
  
    def show
      @menu = Menu.find(params[:id])
    end
  
    def new
      @menu = Menu.new
    end
  
    def edit
      @menu = Menu.find(params[:id])
    end
  
    def create
      @menu = Menu.new(menu_params)
  
      respond_to do |format|
        if @menu.save
          format.html { redirect_to menu_url(@menu), notice: "Menu was successfully created." }
          format.json { render :show, status: :created, location: @menu }
        else
          format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @menu.errors, status: :unprocessable_entity }
        end
      end
    end
    
    def update
      @menu = Menu.find(params[:id])
  
      if @menu.update(menu_params)
        redirect_to @menu
      else
        render :edit, status: :unprocessable_entity
      end
    end
    
    def destroy
      @menu = Menu.find(params[:id])
  
      @menu.destroy
  
      redirect_to action: "index"
    end
  
    private
    # Only allow a list of trusted parameters through.
    def menu_params
      params.require(:menu).permit(:name, :description, :price)
    end
  end
  