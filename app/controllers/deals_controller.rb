class DealsController < ApplicationController
  before_filter :assign_deal, only: [ :show, :edit, :update, :destroy ]
  before_filter :set_view_paths, only: :show

  def index
    @deals = Deal.all
  end

  def show
    respond_to do |format|
      format.html { render layout: "deals/show" }
      format.json { render json: @deal }
    end
  end

  def new
    @advertiser = Advertiser.find(params[:advertiser_id])
    @deal = @advertiser.deals.build
  end

  def create
    @advertiser = Advertiser.find(params[:advertiser_id])
    @deal = @advertiser.deals.build(params[:deal])
    if @deal.save
      redirect_to edit_deal_path(@deal), notice: 'Deal was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @deal.update_attributes(params[:deal])
      redirect_to edit_deal_path(@deal), notice: 'Deal was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @deal.destroy
    redirect_to deals_url
  end


  protected

  def assign_deal
    @deal = Deal.find(params[:id])
  end

  def set_view_paths
    prepend_view_path "app/themes/#{@deal.advertiser.publisher.theme}/views"
  end
end
