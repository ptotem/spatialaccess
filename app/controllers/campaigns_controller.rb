class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]

  def import
    # Campaign.import(params[:file], current_client)
    # redirect_to '/admin', notice: "Campaign imported."
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

    # @channels=@campaign.channels.uniq.sort_by! { |c| c.name }
    @channels = CalculatedData.where(:campaign_id => @campaign.id).map{|i| i.channel_id}

    @annochannels=[]
    @channels.each do |c|
      @annochannels << Annochannel.where(campaign_id: @campaign.id, showable: true, channel_id: c).first
    end

    #@annochannels = Annochannel.where(campaign_id: @campaign.id, showable: true).all.sort_by! { |c| c.channel.name }
    # @annochannels = Annochannel.where(campaign_id: @campaign.id, showable: true).all
    @channel_slots=[]
    @channel_spots=[]
    @channel_maxes=[]
    CalculatedData.where(:campaign_id =>@campaign.id).order(:channel_name).uniq_by(&:channel_id).map{|i| i.channel_slots.map{|i,v| @channel_slots<<[i,eval(v)]}}
    CalculatedData.where(:campaign_id =>@campaign.id).order(:channel_name).uniq_by(&:channel_id).map do |i|
      if !i.channel_spots.nil?
        i.channel_spots.map{|i,v| @channel_spots<<[i,eval(v)]}
      end
    end
    CalculatedData.where(:campaign_id =>@campaign.id).order(:channel_name).uniq_by(&:channel_id).map do |i|
      if !i.channel_maxes.nil?
        i.channel_maxes.map{|i,v| @channel_maxes<<[i,eval(v)]}
      end
    end
    gon.channels=@annochannels.map { |c| c.channel.name.upcase }
    gon.channel_slots=@channel_slots
    gon.channel_spots=@channel_spots
    gon.channel_max=@channel_maxes
    # render :json => @annochannels
    # return
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


    #This code will come inside a
    if CalculatedData.where(:campaign_id => @campaign.id).blank?

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
          @tvr << [hour.name.to_i, (Slot.where(channel_id: channel.id, hour_id: hour.id).first.tvr rescue "")]
        end
        temp = Hash.new
        temp[channel.name] = @tvr
        @channel_slots<<[channel.name, @tvr]
        #Creating Calculated data record for each channel slots
        CalculatedData.create!(:campaign_id => @campaign.id, :channel_id =>channel.id, :channel_name=> channel.name, :channel_slots => temp)
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
        #Finding calculated data created earlier and updating channel spots and channel maxes
        @cal_data = CalculatedData.where(:campaign_id => @campaign.id, :channel_id => channel.id).first
        @channel_spots<<[channel.name, @hoursum]
        temp1 = Hash.new
        temp1[channel.name] = @hoursum
        @cal_data.channel_spots = temp1
        @channel_maxes<<[channel.name, @maxvalue]
        temp2 = Hash.new
        temp2[channel.name] = @maxvalue
        @cal_data.channel_maxes = temp2
        @cal_data.save
        # Spot.where()
      end
      @campaign.delay.delete_all_slots_and_spots
    else
      @campaign.delay.delete_all_slots_and_spots
      @channel_slots=[]
      @channel_spots=[]
      @channel_maxes=[]
      CalculatedData.where(:campaign_id =>@campaign.id).order(:channel_name).uniq_by(&:channel_id).map{|i| i.channel_slots.map{|i,v| @channel_slots<<[i,eval(v)]}}
      CalculatedData.where(:campaign_id =>@campaign.id).order(:channel_name).uniq_by(&:channel_id).map do |i|
        if !i.channel_spots.nil?
          i.channel_spots.map{|i,v| @channel_spots<<[i,eval(v)]}
        end
      end
      CalculatedData.where(:campaign_id =>@campaign.id).order(:channel_name).uniq_by(&:channel_id).map do |i|
        if !i.channel_maxes.nil?
          i.channel_maxes.map{|i,v| @channel_maxes<<[i,eval(v)]}
        end
      end

      @channels=CalculatedData.where(:campaign_id =>@campaign.id).order(:channel_name)
      @annochannels=[]
      if @campaign.annochannels.blank?
        @channels.each do |channel|
          @annochannels << Annochannel.create!(channel_id: channel.id, campaign_id: @campaign.id)
        end
      else
        @channels.each do |channel|
          @annochannels << Annochannel.where(channel_id: channel.channel_id, campaign_id: @campaign.id).first
        end
      end
      # render :json => @annochannels
      # return

    end
    gon.channels=CalculatedData.where(:campaign_id =>@campaign.id).order(:channel_name).map { |c| c.channel_name }
    gon.channel_slots=@channel_slots
    gon.channel_spots=@channel_spots
    gon.channel_max=@channel_maxes
    # render :json => gon.channels
    # return
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
    @campaign.sfile = params[:tvrfile]
    @campaign.cfile = params[:spotsfile]
    @campaign.save
    Slot.delay.import(@campaign.id)
    Campaign.delay.import(@campaign.id)
    # Campaign.delay.calculate_data(@campaign.id)
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
