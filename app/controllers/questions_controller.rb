class QuestionsController < ApplicationController

  # GET /resources/1/questions
  # GET /resources/1/questions.json
  def index
    @resource = Resource.find(params[:resource_id])
    @questions = @resource.questions
    
    respond_to do |format|
      format.json { render json: @questions }
    end
  end


end
