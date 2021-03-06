class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :edit, :update, :destroy]

  # GET /skills/new
  def new
    @skill = Skill.new
  end

  # GET /skills/1/edit
  def edit
    @skilltype = Skilltype.find(params[:skilltype_id])
  end

  # POST /skills
  # POST /skills.json
  def create
    # http://stackoverflow.com/questions/22446647/undefined-method-model-url
    @skilltype = Skilltype.find(params[:skilltype_id])
    @skill = @skilltype.skills.build(skill_params)

    respond_to do |format|
      if @skill.save
        format.html { redirect_to @skilltype, notice: 'Skill was successfully created.' }
        format.json { render :show, status: :created, location: @skill }
      else
        format.html { render :new }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skills/1
  # PATCH/PUT /skills/1.json
  def update
    @skilltype = Skilltype.find(params[:skilltype_id])
    
    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to @skilltype, notice: 'Skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @skill }
      else
        format.html { render :edit }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.json
  def destroy
    @skill.destroy
    respond_to do |format|
      format.html { redirect_to skills_url, notice: 'Skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill
      @skill = Skill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_params
      params.require(:skill).permit(:name, :skilltype_id)
    end
end
