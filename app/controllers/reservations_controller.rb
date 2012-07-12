
class ReservationsController < ApplicationController
  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
    session[:reservation_params] ||= {}
    @reservation = Reservation.new(session[:reservation_params])
    @reservation.current_step = session[:reservation_step]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reservations }
    end
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
    @reservation = Reservation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reservation }
    end
  end

  # GET /reservations/new
  # GET /reservations/new.json
  def new
    session[:reservation_params] ||= {}
    @reservation = Reservation.new(session[:reservation_params])
    @reservation.current_step = session[:reservation_step]
  end

  # GET /reservations/1/edit
  def edit
    @reservation = Reservation.find(params[:id])
  end

  # POST /reservations
  # POST /reservations.json
  def create
    session[:reservation_params].deep_merge!(params[:reservation]) if params[:reservation]
      @reservation = Reservation.new(session[:reservation_params])
      @reservation.current_step = session[:reservation_step]
      if @reservation.valid?
        if params[:back_button]
          @reservation.previous_step
        elsif @reservation.last_step?
          @reservation.save if @reservation.all_valid?
        else
          @reservation.next_step
        end
        session[:reservation_step] = @reservation.current_step
      end
      if @reservation.new_record?
        render "new"
      else
        session[:reservation_step] = session[:reservation_params] = nil
        flash[:notice] = "Reservation created!"
        redirect_to @reservations
      end
  end

  # PUT /reservations/1
  # PUT /reservations/1.json
  def update
    @reservation = Reservation.find(params[:id])

    respond_to do |format|
      if @reservation.update_attributes(params[:reservation])
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to reservations_url }
      format.json { head :no_content }
    end
  end
end
