class CompanytoeventDetailsController < ApplicationController
  # GET /companytoevent_details
  # GET /companytoevent_details.json
  def index
    @companytoevent_details = CompanytoeventDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companytoevent_details }
    end
  end

  # GET /companytoevent_details/1
  # GET /companytoevent_details/1.json
  def show
    @companytoevent_detail = CompanytoeventDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @companytoevent_detail }
    end
  end

  # GET /companytoevent_details/new
  # GET /companytoevent_details/new.json
  def new
    @companytoevent_detail = CompanytoeventDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @companytoevent_detail }
    end
  end

  # GET /companytoevent_details/1/edit
  def edit
    @companytoevent_detail = CompanytoeventDetail.find(params[:id])
  end

  # POST /companytoevent_details
  # POST /companytoevent_details.json
  def create
    @companytoevent_detail = CompanytoeventDetail.new(params[:companytoevent_detail])

    respond_to do |format|
      if @companytoevent_detail.save
        format.html { redirect_to @companytoevent_detail, notice: 'Companytoevent detail was successfully created.' }
        format.json { render json: @companytoevent_detail, status: :created, location: @companytoevent_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @companytoevent_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /companytoevent_details/1
  # PUT /companytoevent_details/1.json
  def update
    @companytoevent_detail = CompanytoeventDetail.find(params[:id])

    respond_to do |format|
      if @companytoevent_detail.update_attributes(params[:companytoevent_detail])
        format.html { redirect_to @companytoevent_detail, notice: 'Companytoevent detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @companytoevent_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companytoevent_details/1
  # DELETE /companytoevent_details/1.json
  def destroy
    @companytoevent_detail = CompanytoeventDetail.find(params[:id])
    @companytoevent_detail.destroy

    respond_to do |format|
      format.html { redirect_to companytoevent_details_url }
      format.json { head :no_content }
    end
  end
end
