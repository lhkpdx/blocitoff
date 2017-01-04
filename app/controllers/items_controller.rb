class ItemsController < ApplicationController

  def create
    @user = current_user
    @item = @user.items.build(item_params)
    if @item.save
      redirect_to root_path, notice: "Your to-do item was saved successfully"
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
         flash[:notice] = "\"#{@item.name}\" was removed because you nailed it!"
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
