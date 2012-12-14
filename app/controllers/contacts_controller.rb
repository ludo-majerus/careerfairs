class ContactsController < ApplicationController
  # GET /contacts
  def index
    @contacts = Contact.all
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
      redirect_to @contact, notice: 'Contact was successfully created.' 
    else
      render action: "new" 
    end
  end

  # PUT /contacts/1
  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      redirect_to @contact, notice: 'Contact was successfully updated.'
    else
      render action: "edit" 
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    redirect_to contacts_url
  end
end
