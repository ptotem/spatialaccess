class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]

  def import
    Campaign.import(params[:file], current_client)
    redirect_to '/admin', notice: "Campaign imported."
  end


  # GET /campaigns
  # GET /campaigns.json
  def index
    @campaigns = Campaign.all
  end

  # GET /campaigns/1
  # GET /campaigns/1.json
  def show

    @channels=@campaign.channels.uniq.sort_by! { |c| c.name }
    @annochannels=[]
    @annochannels = Annochannel.where(campaign_id: @campaign.id, showable: true).all.sort_by! { |c| c.channel.name }

    @channel_slots=[]
    @annochannels.each do |annochannel|
      @tvr=[]
      Hour.all.each do |hour|
        @tvr << [hour.name.to_i, Slot.where(channel_id: annochannel.channel_id, hour_id: hour.id).first.tvr]
      end
      @channel_slots<<[annochannel.channel.name, @tvr]
    end

    @channel_spots=[]
    @totalcount=[]
    @annochannels.each_with_index do |annochannel, index|
      @hourcount=[]
      Hour.all.each do |hour|
        @hourcount << Spot.where(channel_id: annochannel.channel.id, campaign_id: @campaign.id, hour_id: hour.id).count
      end
      @totalcount[index]=@hourcount.sum
      @hoursum=[]
      Hour.all.each do |hour|
        @hoursum << [hour.name.to_i, (Spot.where(channel_id: annochannel.channel.id, campaign_id: @campaign.id, hour_id: hour.id).count*100/@totalcount[index]).to_i]
      end
      @channel_spots<<[annochannel.channel.name, @hoursum]
    end
    gon.channels=@annochannels.map { |c| c.channel.name }
    gon.channel_slots=@channel_slots
    gon.channel_spots=@channel_spots

  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new
  end

  # GET /campaigns/1/edit
  def edit

    @channels=@campaign.channels.uniq.sort_by! { |c| c.name }
    @annochannels=[]
    if @campaign.annochannels.blank?
      @channels.each do |channel|
        @annochannels << Annochannel.create!(channel_id: channel.id, campaign_id: @campaign.id)
      end
    else
      @channels.each do |channel|
        @annochannels << Annochannel.where(channel_id: channel.id, campaign_id: @campaign.id).first
      end
    end

    @channel_slots=[]
    @channels.each do |channel|
      @tvr=[]
      Hour.all.each do |hour|
        @tvr << [hour.name.to_i, Slot.where(channel_id: channel.id, hour_id: hour.id).first.tvr]
      end
      @channel_slots<<[channel.name, @tvr]
    end

    @channel_spots=[]
    @totalcount=[]
    @channels.each_with_index do |channel, index|
      @hourcount=[]
      Hour.all.each do |hour|
        @hourcount << Spot.where(channel_id: channel.id, campaign_id: @campaign.id, hour_id: hour.id).count
      end
      @totalcount[index]=@hourcount.sum
      @hoursum=[]
      Hour.all.each do |hour|
        @hoursum << [hour.name.to_i, (Spot.where(channel_id: channel.id, campaign_id: @campaign.id, hour_id: hour.id).count*100/@totalcount[index]).to_i]
      end
      @channel_spots<<[channel.name, @hoursum]
    end
    gon.channels=@channels.map { |c| c.name }
    gon.channel_slots=@channel_slots
    gon.channel_spots=@channel_spots

  end

  # POST /campaigns
  # POST /campaigns.json
  def create
    @campaign = Campaign.new(campaign_params)

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to @campaign, notice: 'Campaign was successfully created.' }
        format.json { render action: 'show', status: :created, location: @campaign }
      else
        format.html { render action: 'new' }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaigns/1
  # PATCH/PUT /campaigns/1.json
  def update
    respond_to do |format|
      if @campaign.update(campaign_params)
        format.html { redirect_to @campaign, notice: 'Campaign was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaigns/1
  # DELETE /campaigns/1.json
  def destroy
    @campaign.destroy
    respond_to do |format|
      format.html { redirect_to campaigns_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_campaign
    @campaign = Campaign.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def campaign_params
    params.require(:campaign).permit(:client_id, :name, :tg, :start_date, :end_date, :markets,
                                     :annochannels_attributes => [:id, :campaign_id, :channel_id, :showable, :header,
                                                                  :annotations_attributes => [:id, :annochannel_id, :comment, :shape, :posx, :posy, :height, :width, :_destroy]
                                     ]
    )
  end
end
