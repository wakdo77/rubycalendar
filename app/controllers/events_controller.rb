class EventsController < ApplicationController
  def index
    # @events = Event.all
    @date = params[:date]
    @events = @date ? Event.where("event_date = ?", @date) : Event.all.order(event_date: :desc)
  end

  def new
    @event = Event.new
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def create
    # render plain: params[:event][:event_date]
    @event = Event.new(params.require(:event).permit(:title, :text, :event_date))
    if @event.save
      redirect_to calendar_path(params: {date: params[:event][:event_date]})
    else
      @date = params[:event][:event_date]
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(params.require(:event).permit(:title, :text, :event_date))
      redirect_to calendar_path(params: {date: params[:event][:event_date]})
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to calendar_path
  end
end
