class ItemsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @user = current_user
    @item = @user.items.build(item_params)
    if @item.save
      redirect_to root_path, notice: "Saved successfully"
    else
      flash.now[:alert] = "Error creating to-do item.  Please try again"
      render :new
    end
  end

  def new
    @user = current_user
    @item = Item.new(:user=>@user)
  end

  def destroy
    @item = Item.find(params[:id])
      if @item.destroy
         flash[:notice] = "Deleted successfully"
         redirect_to root_path
       else
         flash.now[:alert] = "There was an error deleting the item."
         render :show
       end
   end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
