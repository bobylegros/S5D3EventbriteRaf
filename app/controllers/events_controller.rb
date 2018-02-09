class EventsController < ApplicationController
  def new
      @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.creator = current_user

    if @event.save
      flash[:success] = "Event créé avec succès ! "
       redirect_to @event
    else
      flash.now[:danger] = "Veuillez complèter tous les champs"
       render 'new'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def edit
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  def participe
    @event = Event.find(params[:id])
    if
      @event.attendees.include? current_user
      flash[:warning] = "Vous êtes déjà inscrit"
      redirect_to @event
    else
      @event.attendees << current_user
      flash[:success] = "Félicitation, vous êtes inscrit à l'événement !"
      redirect_to @event
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def unfollow
    @event = Event.find(params[:id])
    @event.attendees.delete(current_user)
    redirect_to current_user
    flash[:warning] = "Vous ne suivez plus cet évenement."

  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "Event mis à jour"
      redirect_to @event
    else
      render 'edit'
    end
  end


  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :place)
  end
end
