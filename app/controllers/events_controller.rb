#encoding: utf-8
class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    if params[:event][:user] == 'current'
      params[:event][:user] = current_user
    else
      params[:event][:user] = nil
    end
    @event = Event.new(params[:event])
    if @event.save
      flash[:success] = "Событие успешно создано!"
      redirect_to calendar_path
    else
      render 'new'
    end
  end

  def show
    @event = Event.find_by_id(params[:id])
  end

  def update
    if params[:event][:user] == 'current'
      params[:event][:user] = current_user
    else
      params[:event][:user] = nil
    end
    @event = Event.find_by_id(params[:id])
    if @event.update_attributes(params[:event])
      flash[:notice] = "Событие успешно обновлено!"
      redirect_to calendar_path
    else
      render 'new'
    end
  end

  def destroy
    Event.find_by_id(params[:id]).destroy
    redirect_to calendar_path, notice: "Событие удалено!" 
  end


end
