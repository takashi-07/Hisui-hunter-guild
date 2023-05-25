class QuestionsController < ApplicationController
  before_action :set_buttons, only: [:easy_gam, :normal_gam, :hard_gam]
 
  def index
  session[:total_count] = 0
  session[:started] = false
  end
  
  def set_buttons
    @hisui_buttons = (1..29).map { |i| ["hisui/hisui#{i}.jpg"] }
    @stones_buttons = (1..43).map { |i| ["stones/stones#{i}.jpg"] }
  end
 
  def easy_gam
  @easy_shuffled_buttons = [@hisui_buttons.sample, @stones_buttons.sample].shuffle
  end
 
  def normal_gam
  @normal_shuffled_buttons = [@hisui_buttons.sample] + @stones_buttons.sample(4)
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
  redirect_back(fallback_location: normal_gam_path)
  end
 
  def result
  session[:total_count] = 0
  session[:started] = false
  end
 
 end