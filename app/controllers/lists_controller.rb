class ListsController < ApplicationController
    before_action :set_list, only: [:show, :destroy]

    def index
        @lists = List.all
    end
  
    def show
        @bookmark = Bookmark.new
    end

    def new
        @list = Restaurant.new # needed to instantiate the form_for
    end
  
    def create
        @list = Restaurant.new(list_params)
        if @list.save
            redirect_to list_path(@list)
        else
            render :new
        end
    end

    def destroy
        @list.destroy
        redirect_to lists_path
    end

  
    private

    def set_list
        @list = List.find(params[:id])
    end

    def list_params
        params.require(:list).permit(:name)
    end

end
