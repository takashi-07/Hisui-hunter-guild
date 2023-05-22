class QuestionsController < ApplicationController
  before_action :set_buttons, only: [:easy_gam, :normal_gam, :hard_gam]
  
  def index
    session[:total_count] = 0
    session[:started] = false
  end

  def set_buttons
    @hisui_buttons = [['hisui/hisui1.jpg'], ['hisui/hisui2.jpg'], ['hisui/hisui3.jpg']]
    @stones_buttons = [['stones/stones1.jpg'], ['stones/stones2.jpg'], ['stones/stones3.jpg'], ['stones/stones4.jpg'] , ['stones/stones5.jpg']]
  end

  def easy_gam
    @easy_shuffled_buttons = [@hisui_buttons.sample, @stones_buttons.sample].shuffle
  end

  def normal_gam
    @normal_shuffled_buttons = [@hisui_buttons.sample] + @stones_buttons.sample(5)
    @normal_shuffled_buttons.shuffle!
  end

  def hard_gam
    @hard_shuffled_buttons = [@hisui_buttons.sample] + @stones_buttons.sample(9)
    @hard_shuffled_buttons.shuffle!
  end

  def answer
    session[:correct_count] ||= 0
    session[:total_count] ||= 0
  
    if params[:answer] == 'hisui'
      flash[:notice] = '正解！'
      session[:correct_count] += 1
    else
      flash[:alert] = '不正解...'
    end
  
    session[:total_count] += 1
  
    if session[:total_count] >= 10
      redirect_to result_path and return
    else
      redirect_to request.referer || normal_gam_path
    end
  end

  def start
    session[:correct_count] = 0
    session[:total_count] = 0
    session[:started] = true
    redirect_to request.referer || normal_gam_path
  end

  def result
    session[:total_count] = 0
    session[:started] = false
  end

end