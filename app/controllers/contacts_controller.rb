class ContactsController < ApplicationController
  # GET /contacts
  def index
    if params[:company_id].present?
      if params[:search].present?
        @search = Contact.search(params[:search])
        @contacts = @search.paginate(:page => params[:page], :per_page => 10)   # or @search.relation to lazy load in view // @search.paginate(:page => params[:page])
      else
        @contacts = Contact.paginate(:page => params[:page], :per_page => 10)
      end
    else
      flash[:error] = 'No company was found.' 
      #redirect_to companies_url
    end
  end

  # GET /contacts/1
  def show
    @contact = Contact.find(params[:id])
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])
  end

  # POST /contacts
  def create
    @contact = Contact.new(params[:contact])

    if @contact.save
      redirect_to contacts_url(:company_id => @contact.company_id), notice: 'Contact was successfully created.' 
    else
      render action: "new" 
    end
  end

  # PUT /contacts/1
  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      redirect_to contacts_url(:company_id => @contact.company_id), notice: 'Contact was successfully updated.'
    else
      render action: "edit" 
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact = Contact.find(params[:id])
    company_id = @contact.company_id
    @contact.destroy

    redirect_to contacts_url(:company_id => company_id)
  end
end
