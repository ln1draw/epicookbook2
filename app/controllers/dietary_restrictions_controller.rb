class DietaryRestrictionsController < ApplicationController
  before_action :set_dietary_restrictions, only: [:show, :edit, :update, :destroy]

  # GET /dietary_restrictions
  # GET /dietary_restrictions.json
  def index
    @dietary_restrictions = DietaryRestriction.all
  end

  # GET /dietary_restrictions/1
  # GET /dietary_restrictions/1.json
  def show
  end

  # GET /dietary_restrictions/new
  def new
    @dietary_restriction = DietaryRestriction.new
  end

  # GET /dietary_restrictions/1/edit
  def edit
  end

  # POST /dietary_restrictions
  # POST /dietary_restrictions.json
  def create
    @dietary_restriction = DietaryRestriction.new(dietary_restriction_params)

    respond_to do |format|
      if @dietary_restriction.save
        format.html { redirect_to @dietary_restriction, notice: 'dietary_restriction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dietary_restriction }
      else
        format.html { render action: 'new' }
        format.json { render json: @dietary_restriction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dietary_restrictions/1
  # PATCH/PUT /dietary_restrictions/1.json
  def update
    respond_to do |format|
      if @dietary_restriction.update(dietary_restriction_params)
        format.html { redirect_to @dietary_restriction, notice: 'dietary_restriction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dietary_restriction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dietary_restrictions/1
  # DELETE /dietary_restrictions/1.json
  def destroy
    @dietary_restriction.destroy
    respond_to do |format|
      format.html { redirect_to dietary_restrictions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dietary_restriction
      @dietary_restriction = DietaryRestriction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dietary_restriction_params
      params[:dietary_restriction]
    end
end
