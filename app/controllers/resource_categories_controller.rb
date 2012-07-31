class ResourceCategoriesController < ApplicationController

  def index
    @resourceCategories = ResourceCategory.all
    @resourceCategory = ResourceCategory.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resources }
    end
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
    @resourceCategory = ResourceCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resourceCategory }
    end
  end

  # GET /resources/new
  # GET /resources/new.json
  def new
    @resourceCategory = ResourceCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resourceCategory }
    end
  end

  # GET /resources/1/edit
  def edit
    @resourceCategory = ResourceCategory.find(params[:id])
  end

  # POST /resources
  # POST /resources.json
  def create
    @resourceCategory = ResourceCategory.new(params[:resource_category])

    respond_to do |format|
      if @resourceCategory.save
        format.html { redirect_to @resourceCategory, notice: 'ResourceCategory was successfully created.' }
        format.json { render json: @resourceCategory, status: :created, location: @resourceCategory }
      else
		logger.debug @resourceCategory.errors.to_yaml
        format.html { render action: "new" }
        format.json { render json: @resourceCategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resources/1
  # PUT /resources/1.json
  def update
    @resourceCategory = ResourceCategory.find(params[:id])

    respond_to do |format|
      if @resourceCategory.update_attributes(params[:resourceCategory])
        format.html { redirect_to @resourceCategory, notice: 'ResourceCategory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resourceCategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resourceCategory = ResourceCategory.find(params[:id])
    @resourceCategory.destroy

    respond_to do |format|
      format.html { redirect_to resources_url }
      format.json { head :no_content }
    end
  end
end
