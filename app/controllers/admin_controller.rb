class AdminController < ApplicationController

 def index
	@resources = Resource.all
	@resource = Resource.new
	@resourceCategories = ResourceCategory.all
	@resourceCategory = ResourceCategory.new
	respond_to do |format|
      format.html { render action: "admin" }
      format.json { head :no_content }
	end
  end
  
end