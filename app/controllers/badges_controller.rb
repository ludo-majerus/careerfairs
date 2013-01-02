class BadgesController < ApplicationController
  # GET /badges
  def index
    @badge = Badge.new

    @badges = Badge.where("companytoevent_id = '" + params[:companytoevent_id].to_s + "'")

  end


  # GET /badges/1/edit
  def edit
    @badge = Badge.find(params[:id])
    @badges = Badge.where("companytoevent_id = '" + params[:companytoevent_id].to_s + "'")

    render action: "index"
  end

  # POST /badges
  def create
    @badge = Badge.new(params[:badge])

    if @badge.save
      redirect_to companytoevent_badges_path @badge.companytoevent_id, notice: 'Badge was successfully created.'
    else
      render action: "new" 
    end
    
  end

  # PUT /badges/1
  def update
    @badge = Badge.find(params[:id])

    if @badge.update_attributes(params[:badge])
      redirect_to companytoevent_badges_path @badge.companytoevent_id, notice: 'Badge was successfully updated.'
    else
      render action: "edit" 
    end
  end

  # DELETE /badges/1
  def destroy
    @badge = Badge.find(params[:id])
    c2e_id = @badge.companytoevent_id
    @badge.destroy

    redirect_to companytoevent_badges_path c2e_id
  end
end
