class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :validates_user, only: [:edit, :update, :destroy]
  respond_to :html

  # GET /courses
  # GET /courses.json
  def index
     params[:teacher].present? ?
     @courses = Course.all.where(deleted: false) : @courses = Course.all
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @concepts = Concept.where(course_id: @course.id).order(fiat: :asc)
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    @course.user_id = current_user.id
    @course.save
    respond_with(@course, location: @course)
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    @course.update(course_params)
    respond_with(@course, location: course_path)
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.update(deleted: true)
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :subtitle, :description, :price, :active, :deleted, :category_id, :image, 
      concepts_attributes: [:id, :name, :fiat, :payment, :course_id, :_destroy, 
       [contents_attributes: [:id, :name, :concept_id, :fiat, :_destroy] ]])
    end

    def validates_user
      unless current_user.present? and @course.user_id == current_user.id
        redirect_to courses_path; flash[:alert] = 'views.not_loged_or_not_owner'
      end
    end
end
