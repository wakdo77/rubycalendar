class EventsController < ApplicationController
  def index
  end

  def new
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def create
    render plain: params[:event].inspect
  end
end
