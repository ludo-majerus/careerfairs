class PagesController < ApplicationController
  before_filter :require_admin_right, :except => [:show]

  # GET /pages
  def index
    @pages = Page.all
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1
  def show
    if params[:id].present?
      @page = Page.find(params[:id])
    end
    render :layout => "blank"
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  def create
    @page = Page.new(params[:page])

    if @page.save
      redirect_to pages_path, notice: 'page was successfully created.'
    else
      render action: "new"
    end

  end

  # PUT /pages/1
  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(params[:page])
      redirect_to pages_path, notice: 'page was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /pages/1
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    redirect_to pages_path
  end
end
