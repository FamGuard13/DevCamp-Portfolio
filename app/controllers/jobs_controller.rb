class JobsController < ApplicationController
  before_action :set_job, only: [:edit, :show, :update, :destroy]
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all

  def index
    @jobs = Job.order('start_date ASC')
  end

  def new
    @job = Job.new
  end

  def create 
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to(qualifications_path, notice: 'Job Created') }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to qualifications_path, notice: 'Job Sucessfully updated' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
    @job.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to qualifications_path, notice: 'Job was removed.' }
    end
  end

  private
  def job_params
    params.require(:job).permit(:name, 
                                :location, 
                                :description, 
                                :start_date, 
                                :end_date, 
                                :logo,
                                :img,
                                :link,
                                :title,
                                :experience,
                                :description_img,
                                :experience_img,
                              )
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
