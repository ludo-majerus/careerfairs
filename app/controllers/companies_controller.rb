class CompaniesController < ApplicationController
  before_filter :require_admin_right, :only => [:index, :new, :create, :destroy]
  before_filter :require_company_right

  # GET /companies
  def index
    if params[:search].present?
      @search = Company.search(params[:search])
      @companies = @search.paginate(:page => params[:page], :per_page => 10)   # or @search.relation to lazy load in view // @search.paginate(:page => params[:page])
    else
      if params[:event_id].nil?
        @companies = Company.paginate(:page => params[:page], :per_page => 10)
      else
        @companies = Company.where(["id in (select company_id from companytoevents where event_id = ?)", params[:event_id]]).paginate(:page => params[:page], :per_page => 10)
      end
    end
    @events = Event.where("date_event > ?", DateTime.now)
  end

  # GET /companies/1
  def show
    @company = Company.find(params[:id])
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
  end

  # POST /companies
  def create
    @company = Company.new(params[:company])

    if @company.save
      redirect_to companies_url, notice: 'Company was successfully created.' 
    else
      render action: "new" 
    end
  end

  # PUT /companies/1
  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(params[:company])
      redirect_to companies_url, notice: 'Company was successfully updated.'
    else
      render action: "edit" 
    end
  end

  # DELETE /companies/1
  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    redirect_to companies_url
  end
end
