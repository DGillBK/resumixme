class DegreesController < ApplicationController
  before_action :set_degree, only: [:show, :edit, :update, :destroy]
  before_filter :authorize

  # GET /degrees/1
  # GET /degrees/1.json
  def show
    @degree = Degree.new
    @degrees = Degree.where(education_id: @education.id)
  end

  # GET /degrees/new
  def new
    @degree = Degree.new
  end

  # GET /degrees/1/edit
  def edit
    @degree = Degree.find(params[:education_id])
  end

  # POST /degrees
  # POST /degrees.json
  def create

    puts("------")
    puts(params[:education_id])
    puts("------")
    
    @education = Education.find(params[:education_id])
    puts(@education.inspect)
    puts("------")
    
    @degree = @education.degrees.build(degree_params)

    respond_to do |format|
      if @degree.save
        format.html { redirect_to @education, notice: 'Degree was successfully created.' }
        format.json { render :show, status: :created, location: @degree }
      else
        format.html { render :new }
        format.json { render json: @degree.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /degrees/1
  # PATCH/PUT /degrees/1.json
  def update
    @education = education.find(params[:education_id])

    respond_to do |format|
      if @degree.update(degree_params)
        format.html { redirect_to @education, notice: 'Degree was successfully updated.' }
        format.json { render :show, status: :ok, location: @degree }
      else
        format.html { render :edit }
        format.json { render json: @degree.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /degrees/1
  # DELETE /degrees/1.json
  def destroy
    @degree.destroy
    respond_to do |format|
      format.html { redirect_to degrees_url, notice: 'Degree was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_degree
      @degree = Degree.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def degree_params
      params.require(:degree).permit(:level, :completed, :education_id)
    end
end
