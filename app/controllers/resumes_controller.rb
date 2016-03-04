class ResumesController < ApplicationController
  before_action :set_resume, only: [:show, :edit, :update, :destroy]
  before_filter :authorize

  # GET /resumes
  # GET /resumes.json
  def index
    @resumes = Resume.where(user_id: current_user.id)
  end

  # GET /resumes/1
  # GET /resumes/1.json
  def show

    require 'json'

    # @resume[:userName] = "testing"

    @resumeHash = {}

    @resumeHash[:userName] = current_user.fname + " " + current_user.lname
    @resumeHash[:name] = @resume[:name]

    interests = @resume[:interests]
    interests = JSON.parse interests
    interests = Interest.where(id: interests).as_json#.to_json#.delete!('\\')



    puts("---raw----")
    puts(interests)
    puts("---raw----")
    puts("---to_json----")
    puts(interests.to_json)
    puts("---to_json----")
    puts("---JSON parse----")
    # puts(JSON.parse interests)
    puts("---JSON parse----")
    @resumeHash[:interests] = interests.to_json

    skills = @resume[:skills]
    skills = JSON.parse skills
    skills = Skilltype.where(id: skills).as_json
    @resume[:skills] = skills

    puts("----resume----")
    puts(@resume.inspect)
    puts("----resume----")

    mustache_render @resumeHash, 'resume1'
  end

  # GET /resumes/new
  def new
    @resume = Resume.new
    @interests = Interest.where(user_id: current_user.id)
    @languages = Language.where(user_id: current_user.id)

    @educations = Education.where(user_id: current_user.id)
    @educations.each do | education |
      education.degrees = Degree.where(education_id: education.id)
    end 

    @employments = Employment.where(user_id: current_user.id)
    @employments.each do | employment |
      employment.positions = Position.where(employment_id: employment.id)
      employment.positions.each do | position |
        position.responsibilities = Responsibility.where(position_id: position.id)
      end
    end

    @skilltypes = Skilltype.where(user_id: current_user.id)
    @skilltypes.each do | skilltype |
      skilltype.skills = Skill.where(skilltype_id: skilltype.id )
    end
    
  end

  # GET /resumes/1/edit
  def edit
  end

  # POST /resumes
  # POST /resumes.json
  def create
    require 'json'
    puts(params)

    # skills
    # http://stackoverflow.com/questions/6210572/how-to-replace-a-hash-key-with-another-key
    # hash[:new_key] = hash.delete :old_key

    params['resume'][:skills] = params['resume'][:skilltype].to_json
    params['resume'].delete :skilltype

    params['resume'][:interests] = params['resume'][:interest].to_json
    params['resume'].delete :interest

    params['resume'][:languages] = params['resume'][:language].to_json
    params['resume'].delete :language

    params['resume'][:employment] = params['resume'][:employment].to_json

    params['resume'][:education] = params['resume'][:education].to_json

    @params = params['resume']



    @resume = Resume.new(resume_params)  

    respond_to do |format|
      if @resume.save
        format.html { redirect_to @resume, notice: 'Resume was successfully created.' }
        format.json { render :show, status: :created, location: @resume }
      else
        format.html { render :new }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resumes/1
  # PATCH/PUT /resumes/1.json
  def update
    respond_to do |format|
      if @resume.update(resume_params)
        format.html { redirect_to @resume, notice: 'Resume was successfully updated.' }
        format.json { render :show, status: :ok, location: @resume }
      else
        format.html { render :edit }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resumes/1
  # DELETE /resumes/1.json
  def destroy
    @resume.destroy
    respond_to do |format|
      format.html { redirect_to resumes_url, notice: 'Resume was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # mustache render
    # http://stackoverflow.com/questions/15754177/whats-the-simplest-way-to-use-mustache-view-templates-in-rails
    def mustache_render(hash, template)
        vw = File.read('./app/views/mustache/' + template + '.html.mustache') || ""
        puts("------------")
        puts( Mustache.render(vw, hash) )
        puts("------------")
        render :text => Mustache.to_html(vw, hash), :layout => true
    end


    def array_to_int array
      array.map(&:to_i)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_resume
      @resume = Resume.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_params
      params.require(:resume).permit(:name, :skills, :languages, :interests, :user_id, :employment, :education, :user_name)
    end
end
