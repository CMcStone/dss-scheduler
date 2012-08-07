class ReservationsController < ApplicationController

  before_filter :init_wizard_session, :only => [:index, :wizard]

  # GET /reservations
  # GET /reservations.json
  def index
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
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
    @reservation = Reservation.find(params[:id])
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @person = Person.find_by_uid(1) #TODO: Change the 0 to the current user UID after implementing the Roles Mgmt
    @reservations = @person.reservations
    @reservation = Reservation.new(params[:reservation])

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render json: @reservation, status: :created, location: @reservation }
      else
        format.html { render action: "new" }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
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
  
  def init_wizard_session
    #debugger
    #session[:reservation_step] = session[:reservation_params] = nil

    session[:reservation_params] ||= {}
    session[:reservation_params].deep_merge!(params[:reservation]) if params[:reservation]
    @reservation = Reservation.new(session[:reservation_params])
    session[:resource_params] ||= {}
    session[:resource_params].deep_merge!(params[:resource]) if params[:resource]
    session[:question_response_params] ||= {}
    session[:question_response_params].deep_merge!(params[:question_response]) if params[:question_response]
    
    @reservation.current_step = session[:reservation_step]
    @person = Person.find_by_uid(1) #TODO: Change the 0 to the current user UID after implementing the Roles Mgmt
    @reservations = @person.reservations
    @resource_categories = ResourceCategory.all
    @departments = Resource.select("DISTINCT(ou_uid), description")

    #debugger
    @resource = @reservation.resource
    @resource_category = @resource.resource_category if @resource
    @resources = @resource_category.resources if @resource_category
    @questions = @resource.questions if @resource
    @questions.each do |q|
        response = q.question_responses.build
    end if (@questions && !response)
  end
  
  def wizard
    #debugger
    
    if params[:back_button]
      @reservation.previous_step
      session[:reservation_step] = @reservation.current_step
    elsif true
      if @reservation.last_step?
        @reservation.save if @reservation.all_valid?
      else
        @reservation.next_step
      end
      session[:reservation_step] = @reservation.current_step
    end
    if @reservation.new_record?
      respond_to do |format|
        format.js
        format.json { head :no_content }
      end
    else
      session[:reservation_step] = session[:reservation_params] = nil
      flash[:notice] = "Reservation created!"
      redirect_to @reservation
    end
  end
end
