class HomeController < ApplicationController
  def index
    if current_client.subdomain=="www"
      @clients=Client.where(internal: true).all
      render "home/wwwindex"
    else
      @sloticons=@customization.sloticons.order("weight ASC")
      @maxweight=@sloticons.map { |s| s.weight }.max
      @iconcounts=[]
      @iconcounts<<(@sloticons.length+2)
      @slotarray=@sloticons
      (@maxweight-1).times do |i|
        repeat_slots=@sloticons.select { |s| s.weight>i+1 }
        @slotarray+=repeat_slots
        @iconcounts<<repeat_slots.length
      end
      @winners=Array.new
      @sloticons.each_with_index do |icon, index|
        @winners << [index+3, 3, (6-index)*10]
        @winners << [index+3, 2, (6-index)*5]
        if icon.weight<2
          @winners << [index+3, 1, (3-index)*5]
        end
      end
      @leaders=User.order('credits DESC').all

      gon.winners= @winners
      gon.bonus_image= @customization.bonus.url(:original)
      gon.qmark_image= @customization.qmark.url(:original)
      gon.iconcounts= @iconcounts
      gon.maxweight= @maxweight
      gon.credits= current_user.credits
      gon.cost= @customization.cost
      gon.userid=current_user.id
    end


  end

  def askquestion
    render json: Question.where(difficulty: params[:toughness]).all.sample.to_json(except: :correct)
  end

  def checkanswer
    @question=Question.find(params[:id])
    @correct= case @question.correct.downcase
                when "opta"
                  @question.opta
                when "optb"
                  @question.optb
                when "optc"
                  @question.optc
                when "optd"
                  @question.optd
                else
                  "#{params[:id]},#{@question.correct},#{@correct}"
              end
    if @question.correct.downcase==params[:answer]
      render text: "#{@question.payoff}|| Awesome! That's right! || #{@correct}"
    else
      render text: "#{0}|| Uh Oh! That's wrong! || #{@correct}"
    end
  end

  def crediting
    @user=User.find(params[:id])
    if params[:txn]=="debit"
      @user.credits-=params[:payoff].to_i
    else
      @user.credits+=params[:payoff].to_i
    end
    @user.save
    render text: @user.credits
  end

end
