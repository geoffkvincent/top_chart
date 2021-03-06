class BillboardsController < ApplicationController
  before_action :set_billboard, only: [:show, :edit, :update, :destroy]
  def index
    @billboards = current_user.billboards 
  end

  def show
  end

  def new
    @billboard = Billboard.new
    render partial: 'form'
  end

  def create
    @billboard = current_user.billboards.new(billboard_params)

    if @billboard.save
      flash[:success] = 'Billboard Created'
      redirect_to @billboard
    else
      render :new
      flash[:error] = "Error #{@account.errors.full_messages.join("\n")}"
    end
  end

  def edit
    render partial: 'form'
  end

  def update
    if @billboards.update(billboard_params)
      redirect_to @billboard
    else
      render :edit
    end
  end

  def destroy
    @billboard.destroy
    redirect_to billboards_path
  end

  private

  def set_billboard
    @billboard = current_user.billboards.find(params[:id])
  end

  def billboard_params
    params.require(:billboard).permit(:name)
  end
end
