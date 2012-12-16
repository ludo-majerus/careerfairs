class BadgesController < ApplicationController
  # GET /badges
  def index
    @badges = Badge.all
    respond_to do |format|
      format.html
      format.xls 
    end
  end

  # GET /badges/1
  def show
    @badge = Badge.find(params[:id])
  end

  # GET /badges/new
  def new
    @badge = Badge.new
  end

  # GET /badges/1/edit
  def edit
    @badge = Badge.find(params[:id])
  end

  # POST /badges
  def create
    @badge = Badge.new(params[:badge])

    if @badge.save
      redirect_to @badge, notice: 'Badge was successfully created.'
    else
      render action: "new" 
    end
    
  end

  # PUT /badges/1
  def update
    @badge = Badge.find(params[:id])

    if @badge.update_attributes(params[:badge])
      redirect_to @badge, notice: 'Badge was successfully updated.'
    else
      render action: "edit" 
    end
  end

  # DELETE /badges/1
  def destroy
    @badge = Badge.find(params[:id])
    @badge.destroy

    redirect_to badges_url
  end
end
