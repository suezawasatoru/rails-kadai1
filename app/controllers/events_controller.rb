class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  
  end

  def create
    @event = Event.new(params.require(:event).permit(:title, :start_date, :end_date, :all_day, :schedule_memo))
    if @event.save
      flash[:notice] = "イベントを新規登録しました"
      redirect_to :events
    else
      flash[:notice] = "イベントの登録に失敗しました"
      render "new"
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
  if @event.update(params.require(:event).permit(:title, :start_date, :end_date, :all_day, :schedule_memo))
    flash[:notice] = "イベント「#{@event.id}」の情報を更新しました"
    redirect_to :events
  else
    flash[:notice] = "イベントの更新に失敗しました"
    render "edit"
  end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to :events

  end

  
end
