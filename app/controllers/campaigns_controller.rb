class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]

  def import
    Campaign.import(params[:file], current_client)
    redirect_to '/admin', notice: "Campaign imported."
  end

  def htmltopdf
    hypdf = HyPDF.htmltopdf(render_to_string('/campaigns/'+params[:id]))
    send_data(hypdf[:pdf], filename: 'hypdf_test.pdf', type: 'application/pdf')
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
    @channel_maxes=[]
    @totalcount=[]
    @annochannels.each_with_index do |annochannel, index|
      @hourcount=[]
      Hour.all.each do |hour|
        @hourcount << Spot.where(channel_id: annochannel.channel.id, campaign_id: @campaign.id, hour_id: hour.id).count
      end
      @totalcount[index]=@hourcount.sum
      @hoursum=[]
      @maxvalue=0
      Hour.all.each do |hour|
        spotscore=(Spot.where(channel_id: annochannel.channel.id, campaign_id: @campaign.id, hour_id: hour.id).count*100/@totalcount[index]).to_i
        @hoursum << [hour.name.to_i, spotscore]
        if spotscore>@maxvalue
          @maxvalue=spotscore
        end
      end
      @channel_spots<<[annochannel.channel.name, @hoursum]
      @channel_maxes<<[annochannel.channel.name, @maxvalue]
    end
    gon.channels=@annochannels.map { |c| c.channel.name.upcase }
    gon.channel_slots=@channel_slots
    gon.channel_spots=@channel_spots
    gon.channel_max=@channel_maxes

  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new
  end

  def edit
  end

  # GET /campaigns/1/edit
  def build_campaign

    @campaign=Campaign.find(params[:id])
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
    @channel_maxes=[]
    @totalcount=[]
    @channels.each_with_index do |channel, index|
      @hourcount=[]
      Hour.all.each do |hour|
        @hourcount << Spot.where(channel_id: channel.id, campaign_id: @campaign.id, hour_id: hour.id).count
      end
      @totalcount[index]=@hourcount.sum
      @hoursum=[]
      @maxvalue=0
      Hour.all.each do |hour|
        spotscore=(Spot.where(channel_id: channel.id, campaign_id: @campaign.id, hour_id: hour.id).count*100/@totalcount[index]).to_i
        @hoursum << [hour.name.to_i, spotscore]
        if spotscore>@maxvalue
          @maxvalue=spotscore
        end
      end
      @channel_spots<<[channel.name, @hoursum]
      @channel_maxes<<[channel.name, @maxvalue]
    end

    gon.channels=@channels.map { |c| c.name.upcase }
    gon.channel_slots=@channel_slots
    gon.channel_spots=@channel_spots
    gon.channel_max=@channel_maxes

  end

  # POST /campaigns
  # POST /campaigns.json
  def create
    @campaign = Campaign.new(campaign_params)

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to get_content_path(@campaign), notice: 'Campaign was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def get_content
    @campaign=Campaign.find(params[:id])
  end

  def import_content
    @campaign=Campaign.find(params[:id])
    Slot.import(params[:tvrfile], @campaign.id)
    Campaign.import(params[:spotsfile], @campaign.id)
    redirect_to edit_campaign_path(@campaign), notice: "Campaign imported."
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
                                     :annochannels_attributes => [:id, :campaign_id, :channel_id, :showable, :header, :comment,
                                                                  :annotations_attributes => [:id, :annochannel_id, :comment, :shape, :posx, :posy, :height, :width, :_destroy]
                                     ]
    )
  end
end
