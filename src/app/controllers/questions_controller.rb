class QuestionsController < ApplicationController
  def index
    hisui_buttons = [['hisui/hisui1.jpg'], ['hisui/hisui2.jpg'], ['hisui/hisui3.jpg']]
    stones_buttons = [['stones/stones1.jpg'], ['stones/stones2.jpg'], ['stones/stones3.jpg']]
    @shuffled_buttons = [hisui_buttons.sample, stones_buttons.sample].shuffle
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

    end
  
    if session[:total_count] >= 10
      redirect_to result_path and return
    end
  
    redirect_to questions_path
  
  end

  def start
    session[:correct_count] = 0
    session[:total_count] = 0
    session[:started] = true
    redirect_to questions_path
   end
  
  def result 
    session[:total_count] = 0
    session[:started] = false
  end


end
